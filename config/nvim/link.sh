#!/bin/sh

if [ ! -d "$HOME/.config/nvim" ]; then
  mkdir -p $HOME/.config/nvim
fi

for FILE in init.vim
do
  ln -fns $PWD/$FILE $HOME/.config/nvim/$FILE
done
