#!/bin/bash

function send_notification() {
	volume=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master) | cut -d% -f1)
	(( $volume > 0 )) && im=''
          (( $volume > 25 )) && im=''
          (( $volume > 50 )) && im='墳'
          (( $volume > 75 )) && im=''
	dunstify -a "changevolume" -u low -r "9991" -h int:value:"$volume" -i "volume-$1" "$im" -t 800
}

case $1 in
up)
	# Set the volume on (if it was muted)
	amixer -q set Master 2%+
	send_notification $1
	;;
down)
	amixer -q set Master 2%-
	send_notification $1
	;;
mute)
	pamixer -t
	if $(pamixer --get-mute); then
		dunstify -i volume-mute -a "changevolume" -t 2000 -r 9993 -u low "Muted"
	else
		send_notification up
	fi
	;;
esac

