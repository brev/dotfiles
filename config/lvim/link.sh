#!/bin/sh

if [ ! -d "$HOME/.config/lvim" ]; then
  mkdir -p $HOME/.config/lvim
fi

for FILE in config.lua
do
  ln -fns $PWD/$FILE $HOME/.config/lvim/$FILE
done
