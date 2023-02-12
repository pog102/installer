#!/bin/bash
albums="$(mpc list album)"
COVER="$HOME/.cache/rofi_musi"
# while read -r album; 
n=1
SAVEIFS=$IFS #for string values whith whitespaces
IFS=$(echo -en "\n\b")
for album in $albums
do
# 	if [ -f "$n.png" ]; then
# 		echo "exits"
# else
# 	echo "hreeeeeeeeeeeeeeeeere"
# fi
if [ "$(( $(ls $COVER | wc -l) - 1))" -ge "$(mpc list album)" ]; then

	
	file=$(mpc find album "$album" | head -n 1)

	ffmpeg -i "$HOME/Music/$file" "${COVER}$n.png" -y #&> /dev/null
	n=$((n+1))
fi
done # < "$albums"
IFS=$SAVEIFS
