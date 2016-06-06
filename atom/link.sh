#!/bin/sh
if [ ! -d "$HOME/.atom/" ]; then
	mkdir -p $HOME/.atom/ || echo 'Mkdir failed'
fi

for FILE in config.cson styles.less
do
	ln -fs $PWD/$FILE $HOME/.atom/$FILE || echo 'Symlink failed'
done

exit 0
