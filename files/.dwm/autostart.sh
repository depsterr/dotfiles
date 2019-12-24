#!/bin/bash

# simple x hotkey daemon
sxhkd &

# xclip
xclip &

# compton
compton &

# wallpaper
~/.fehbg &

# date
while true; do
	xsetroot -name "| $(< /sys/class/power_supply/BAT1/capacity)% | $(< /sys/class/power_supply/BAT1/status) | $(date +%a\ %d\ %b\ %R:%S) |"
	sleep 5
done &
