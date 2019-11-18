# startx if logging in in the startup tty
if [ "$(tty)" = "/dev/tty1" ]; then
	clear
	echo "\n\n"
	neofetch --ascii
	echo "\033[0;36m\n\n  Welcome!\n\n   What do you want to open?\n\n\033[0;34m    [x] start the x server\n    [t] continue to tty\n    [T] open tmux in the tty\n    [w] set up wifi and then start the x server"
	read xtTw
	case $xtTw in
		[x]* ) startx;;
		[t]* ) clear;;
		[T]* ) tmux;;
		[w]* ) sudo wifi-menu && startx;;
		* ) echo "invalid response, defaulting to tty";;
	esac
fi
