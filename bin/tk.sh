#!/usr/bin/env bash
set -e
source $HOME/.cache/wal/colors.sh 
if [ -d "/media/USB" ]
then
df -h /media/USB  --output=used | tail -1 | xargs echo "<span color=\"$color13\"> </span>"
fi

#date +%s
