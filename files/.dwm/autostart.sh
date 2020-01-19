#!/bin/bash

# simple x hotkey daemon
sxhkd &

# xclip
xclip &

# compton
compton &

# wallpaper
~/.fehbg &

# bar
while true; do
	ADDR=`ip addr | awk '!/127.0.0.1/&&/inet / { gsub("/"," "); print $2; }'`
	xsetroot -name "| $([ -z "$ADDR" ] && echo "No Internet" || echo "$ADDR") | $(< /sys/class/power_supply/BAT1/capacity)% | $(< /sys/class/power_supply/BAT1/status) | $(date +%a\ %d\ %b\ %R:%S) "
	sleep 5
done &
