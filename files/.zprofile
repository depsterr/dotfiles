export PATH=$PATH:/sbin/:/home/deppy/.local/bin:/snap/bin/:~/.scripts/:/home/deppy/.gem/ruby/2.6.0/bin:/home/deppy/.gem/ruby/2.6.0/gems
export _JAVA_AWT_WM_NONREPARENTING=1
if [ "$(tty)" = "/dev/tty1" ]; then
	sh ~/.scripts/login_script
fi
