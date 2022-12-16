#!/bin/bash
        xrandr --auto --output eDP-1 --mode 1920x1080 --primary --output HDMI-1-0 --off
		sh ~/.config/polybar/launch.sh
        notify-send " xrandr" "Screen layout changed: eDP-1"
