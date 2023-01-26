#!/bin/bash
COVER="/tmp/.music_cover.png"
# if [ -z "$(mpc | grep 'paused')" ]; then
s=$(mpc -f "%title%;%artist%" | head -n 1)
song=$(echo "$s" | cut -d';' -f1)
title=$(echo "$s" | cut -d';' -f2)
ffmpeg -i "$HOME/Music/$(mpc current -f %file%)" "${COVER}" -y &> /dev/null
notify-send -i $COVER "$song" "$title" -t 5000 -r 4
# fi
