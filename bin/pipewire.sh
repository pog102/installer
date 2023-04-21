
#!/bin/zsh

set -e
source $HOME/.cache/wal/colors.sh
WP_OUTPUT=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

    if [[ $WP_OUTPUT =~ ^Volume:[[:blank:]]([0-9]+)\.([0-9]{2})([[:blank:]].MUTED.)?$ ]]; then
        if [[ -n ${BASH_REMATCH[3]} ]]; then
            printf "MUTE\n"
        else
            volume=$((10#${BASH_REMATCH[1]}${BASH_REMATCH[2]}))
	fi
    fi




if [ ! -z $(echo $volume | grep "MUTED") ] || [ $(echo $volume) -ne 0 ]; then 
    if [[ $volume -le 100 && $volume -gt 50 ]]; then
        echo "<span color=\"$color13\"> </span> $volume%"
    elif [[ $volume -le 50 && $volume -gt 25 ]]; then
        echo "<span color=\"$color13\"> </span> $volume%"
    elif [[ $volume -le 25 && $volume -gt 0 ]]; then
        echo "<span color=\"$color13\"> </span> $volume%"
    fi
else
    echo "MUTE"
fi
