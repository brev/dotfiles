#!/bin/sh

ln -ns "$PWD" ~/.dotfiles

for FILE in inputrc prettierrc profile stylelintrc.json vimrc zshrc; do
	ln -fns "$PWD/$FILE" "$HOME/.$FILE"
done

for DIR in config iterm2 ssh; do
	cd "$DIR" || exit
	./link.sh
	cd ..
done
