#!/bin/sh
if [ ! -d "$HOME/.atom/" ]; then
	mkdir -p $HOME/.atom/ || echo 'Mkdir failed'
fi

if [ -e "$HOME/.atom/config.cson" ]; then
	echo "File already exists cannot symlink"
	exit 1
fi

ln -fs $PWD/config.cson $HOME/.atom/config.cson || echo 'Symlink failed'

exit 0