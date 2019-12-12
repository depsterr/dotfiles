#!/bin/sh

# simple x hotkey daemon
sxhkd &

# comption
compton &

# wallpaper
~/.fehbg &

# date
while true; do
	xsetroot -name " $(acpi) | $(date +%a\ %d\ %b\ %R)"
	sleep 5
done &
