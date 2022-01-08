#!/bin/sh

for FILE in ackrc gitconfig inputrc profile vimrc zshrc
do
	ln -f -s ~/src/dotfiles/$FILE ~/.$FILE
done

for DIR in config iterm2 ssh vscode
do
  cd $DIR
  ./link.sh
  cd ..
done
