#!/usr/bin/bash

# udev will wait for our script to finish before the monitor is available
# for use, so we will use the `at` command to run our command again as
# another user:
if [ "$1" != "forked" ]; then
    echo "$(dirname $0)/$(basename $0) forked" | at now
    exit
fi
# udev runs as root, so we need to tell it how to connect to the X server:
export DISPLAY=:0
export XAUTHORITY=/home/chad/.Xauthority

if [[ $(xrandr -q | grep "HDMI-1-0 connected") ]]; then
xrandr --output HDMI-1-0 --mode 1920x1080 --rate 144 --primary --output eDP-1 --off
else
xrandr --output eDP-1 --auto --output HDMI-1-0 --off
fi

