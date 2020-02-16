#!/bin/sh

# simple x hotkey daemon
sxhkd &

# xclip
xclip &

# compton
compton &

# wallpaper
~/.fehbg &

# bar
# for whatever reason < /sys/class/power_supply/BAT1/capacity doesn't work, so I have to use cat :/ (works in bash and zsh, but not in dash)
while true; do
	ADDR=`ip addr | awk '!/127.0.0.1/&&/inet / { gsub("/"," "); print $2; }'`
	xsetroot -name "| $([ -z "$ADDR" ] && echo "No Internet" || echo "$ADDR") | $(cat /sys/class/power_supply/BAT1/capacity)% | $(cat /sys/class/power_supply/BAT1/status) | $(date +%a\ %d\ %b\ %R:%S) "
	sleep 5
done &
