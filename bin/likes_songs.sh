#!/bin/bash
COVER="$HOME/.cache/music/$(mpc current -f %album%).png"
file="$(mpc current -f %file%)"
song="$(mpc current -f %title%)"
playlist="$HOME/playlist/liked.m3u"
if grep -q "$file" "$playlist"
then
    sed -i "/$file/d"  "$playlist" #updates progress
   notify-send -i "$COVER"  "$song" "removed" -t 5000 -r 4
else
 echo "$file" >>   "$playlist"
  notify-send -i "$COVER"  "$song" "added" -t 5000 -r 4
fi

