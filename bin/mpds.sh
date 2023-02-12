#!/bin/bash
COVER="/tmp/.music_cover.png"
# if [ -z "$(mpc | grep 'paused')" ]; then
song=$(mpc current -f '%title%')
title=$(mpc current -f '%artist%')
 # mpc status "%currenttime%
 # mpc status "%totaltime%"
 # 
ffmpeg -i "$HOME/Music/$(mpc current -f %file%)" "${COVER}" -y &> /dev/null
notify-send -i $COVER "$song" "$title" -t 5000 -r 4
# fi
