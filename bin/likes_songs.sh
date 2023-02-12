#!/bin/bash
COVER="/tmp/.music_cover.png"
# if [ -z "$(mpc | grep 'paused')" ]; then
# s=$(mpc -f "%title%;%artist%" | head -n 1)
# song=$(echo "$s" | cut -d';' -f1)
# title=$(echo "$s" | cut -d';' -f2)
# ffmpeg -i "$HOME/Music/$(mpc current -f %file%)" "${COVER}" -y &> /dev/null
file="$(mpc current -f %file%)"
song="$(mpc current -f %title%)"
playlist="$HOME/Music/liked.m3u"
# if [[ grep "$file" "~/Music/liked.m3u" ]]; then
if grep -q "$file" "$playlist"
then
    sed -i "/$file/d"  "$playlist" #updates progress
   notify-send -i $COVER  "$song" "removed" -t 5000 -r 4
else
 echo "$file" >>   "$playlist"
  notify-send -i $COVER  "$song" "added" -t 5000 -r 4
fi
# notify-send -i $COVER "$song" "$title" -t 5000 -r 4
# fi

