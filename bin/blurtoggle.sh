#!/usr/bin/sh

if pgrep -x "picom" > /dev/null
then
polybar-msg action "#blur-toggle.hook.1"
 picom -b --config=/home/$USER/.config/picom/picom.conf --experimental-backends --backend glx --blur-method dual_kawase &
else
 polybar-msg action "#blur-toggle.hook.0"
	killall picom
fi
