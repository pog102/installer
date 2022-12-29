#!/bin/bash

if xrandr | grep 'HDMI-1-0' | grep ' connected' &>/dev/null; then
  if xrandr --listactivemonitors | grep -q 'eDP-1'; then
		sh ~/.config/polybar/launch.sh
        xrandr --output HDMI-1-0 --mode 1920x1080 --rate 144 --primary --output eDP-1 --off
        # xrandr --output HDMI-1-0 --auto --output eDP-1 --off
        notify-send " xrandr" "Screen layout changed: HDMI-1-0"
  else
        xrandr --output eDP-1 --auto --output HDMI-1-0 --mode 1920x1080 --rate 144 --primary --right-of eDP-1

		sh ~/.config/polybar/launch.sh
		polybar hdmi &
        notify-send " xrandr" "Screen layout changed: HDMI-1-0 + eDP-1"
  fi
else
  notify-send " xrandr" "No external displays connected"
fi


