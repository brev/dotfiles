#!/bin/sh

for FILE in ackrc gitconfig inputrc profile zshrc
do
	ln -f -s ~/src/dotfiles/$FILE ~/.$FILE
done

for DIR in iterm2 sublime
do
  cd $DIR
  ./link.sh
  cd ..
done
