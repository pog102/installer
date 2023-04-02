#!/bin/bash
# COVER="$HOME/.cache/.music_cover.png"
COVER="$HOME/.cache/music"
song=$(mpc current -f '%title%')
title=$(mpc current -f '%artist%')
album="$(mpc current -f %album%).png"
[ -d "$COVER" ] || mkdir "$COVER"
 # mpc status "%currenttime%
 # mpc status "%totaltime%"
# ffmpeg -i "$HOME/Music/$(mpc current -f %file%)" "${COVER}" -y &> /dev/null
# notify-send -i $COVER "$song" "$title" -t 2700 -r 4
if [ -f "$COVER/$album" ]
then
notify-send -i "$COVER/$album" "$song" "$title" -t 2700 -r 4
else
ffmpeg -i "$HOME/Music/$(mpc current -f %file%)" "$HOME/.cache/music/tmp.png" -y &> /dev/null
notify-send -i "$HOME/.cache/music/tmp.png" "$song" "$title" -t 2700 -r 4
fi
