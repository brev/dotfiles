#!/bin/sh

for FILE in ackrc gitconfig inputrc profile zshrc
do
	ln -f -s ~/src/dotfiles/$FILE ~/.$FILE
done

for DIR in atom iterm2 ssh
do
  cd $DIR
  ./link.sh
  cd ..
done
