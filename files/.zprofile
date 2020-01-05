export PATH=$PATH:/home/deppy/.gem/ruby/2.6.0/bin:/home/deppy/.gem/ruby/2.6.0/gems
if [ "$(tty)" = "/dev/tty1" ]; then
	sh ~/.scripts/login_script
fi
export PATH="$PATH:$HOME/.scripts/"
