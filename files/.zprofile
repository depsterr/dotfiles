# fix the keyboard layout
setxkbmap -model pc105 -layout us,se -variant ,swerty -option grp:alt_shift_toggle
# startx if logging in in the startup tty
if [ "$(tty)" = "/dev/tty1" ]; then
	zsh ~/.scripts/login.sh
fi
