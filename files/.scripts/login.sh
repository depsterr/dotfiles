# startx if logging in in the startup tty
if [ "$(tty)" = "/dev/tty1" && "$loggedin" == "" ]; then
	export loggedin = true
	clear
	echo "Welcome!\n\nWhat do you want to open?\n\n[x] start the x server\n[t] continue to tty\n[T] open tmux in the tty\n\n"
	read xtT
	case $xtT in
		[x]* ) startx;;
		[t]* ) clear;;
		[T]* ) tmux;;
		* ) echo "invalid response, defaulting to tty";;
	esac
fi
