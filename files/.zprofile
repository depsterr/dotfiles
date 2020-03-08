export PATH=$PATH:/sbin/:/home/deppy/.local/bin:/snap/bin/:~/.scripts/:/home/deppy/.gem/ruby/2.6.0/bin:/home/deppy/.gem/ruby/2.6.0/gems:/opt/
if [ "$(tty)" = "/dev/tty1" ]; then
	sh ~/.scripts/login_script
fi
