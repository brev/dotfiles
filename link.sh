#!/bin/sh

ln -ns $PWD ~/.dotfiles

for FILE in ackrc gitconfig inputrc profile vimrc zshenv zshrc
do
	ln -fns $PWD/$FILE ~/.$FILE
done

for DIR in config iterm2 ssh vscode
do
  cd $DIR
  ./link.sh
  cd ..
done
