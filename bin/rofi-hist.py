#!/usr/bin/env python3

import sqlite3
import subprocess
from argparse import ArgumentParser
from configparser import ConfigParser
from os import environ
from pathlib import Path
from hashlib import sha256
from contextlib import closing, contextmanager, suppress
from tempfile import NamedTemporaryFile
from shutil import copyfile

cache_dir = Path(environ.get('XDG_CACHE_HOME', Path.home() / '.cache')) / 'rofi-history'
firefox_dir = Path.home() / '.mozilla/firefox'

# b/c sqlite databases are locked by firefox we need copy them into a temporary location and connect to them there
@contextmanager
def temp_sqlite(path):
    with NamedTemporaryFile() as temp_loc:
        copyfile(path, temp_loc.name)
        with closing(sqlite3.connect(temp_loc.name)) as conn:
            yield conn

# go through all installs and choose the first profile you find.
# a better option would be to use the "which firefox" command, but that would add a dependency on cityhash
def default_profile_path():
    installs = ConfigParser()
    installs.read(firefox_dir / 'installs.ini')
    for i in installs.values():
        with suppress(KeyError):
            return firefox_dir / i['Default']
    raise Exception("could not find a default profile in installs.ini")

# get Path to profile directory from profile name
def path_from_name(name):
    profiles = ConfigParser()
    profiles.read(firefox_dir / 'profiles.ini')
    for i in profiles.values():
        with suppress(KeyError):
            if i['Name'] == name:
                return firefox_dir / i['Path']
    raise Exception("no profile with this name")

# add icon file to cache (in ~/.cache/rofi-history)
def cache_icon(icon):
    loc = cache_dir / sha256(icon).hexdigest()
    if not cache_dir.exists():
        cache_dir.mkdir()
    if not loc.exists():
        loc.write_bytes(icon)
    return loc

# main function, finds all history items inside of search_path and their corresponding icons and prints them in a rofi-readable form
def write_rofi_input(profile_loc, search_path=[], sep=' / '):
    with temp_sqlite(profile_loc / 'places.sqlite') as places:
        conn_res = places.execute("""SELECT moz_historyvisits.visit_date, moz_places.title, moz_places.url
                                     FROM moz_historyvisits LEFT JOIN moz_places ON moz_historyvisits.place_id=moz_places.id
                                     ORDER BY moz_historyvisits.visit_date DESC
                                  """).fetchall()

    with temp_sqlite(profile_loc / 'favicons.sqlite') as favicons:
        for visit_date, title, url in conn_res:
            if url is not None and url != '':
                path_arr = search_path  # use search_path as the path for history items, since they don't have parent folders

                if (title is not None) and all(name in title for name in search_path):  # check if search_path is a substring of title
                    # icon = favicons.execute(f"""SELECT max(ic.data)
                    #                            FROM moz_icons ic
                    #                            JOIN moz_pages_w_icons pwic ON ic.icon_id = pwic.icon_id
                    #                            WHERE pwic.page_url = '{url}'"""
                    #                          ).fetchone()[0]
                    #
                    # if icon is not None:
                    #     icon_file = cache_icon(icon)
                    #     print(f"{title} | {url} | {icon_file}")
                    print(f"{title}\x00info\x1f{url}")

if __name__ == '__main__':
    # parser = ArgumentParser(description='Generate a list of

    parser = ArgumentParser(description="generate list of bookmarks with icons for rofi")
    parser.add_argument('path',              default="",    nargs='?',      help="restrict list to a bookmark folder")
    parser.add_argument('-s', '--separator', default=" / ", metavar='sep',  help="seperator for paths")
    parser.add_argument('-p', '--profile',                  metavar='prof', help="firefox profile to use")
    args, _ = parser.parse_known_args()   # rofi gives us selected entry as additional argument -> ignore (not useful)

    if environ.get('ROFI_RETV') == '1':
        prof = [] if args.profile is None else ["-P", args.profile]
        subprocess.Popen(["firefox", environ['ROFI_INFO']] + prof, close_fds=True, start_new_session=True, stdout=subprocess.DEVNULL)
    else:
        search_path = [i for i in args.path.split('/') if i != '']
        profile_path = default_profile_path() if args.profile is None else path_from_name(args.profile)

        print("\x00prompt\x1f ")  # change prompt
        write_rofi_input(profile_path, search_path=search_path, sep=args.separator)
