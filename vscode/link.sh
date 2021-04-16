#!/bin/sh

CFG="$HOME/Library/ApplicationSupport/Code/User/"

if [ ! -d $CFG ]; then
  echo 'vscode config dir not found' || exit 1
fi

for FILE in settings.json
do
	ln -fs $PWD/$FILE $CFG/$FILE || echo 'Symlink failed'
done

exit 0
