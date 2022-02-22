#!/bin/sh
if [ ! -d "$HOME/.ssh/" ]; then
	echo 'Missing .ssh/ dir!'
	exit 1
fi

for FILE in config
do
	ln -fns $PWD/$FILE $HOME/.ssh/$FILE || echo 'Symlink failed'
done

exit 0
