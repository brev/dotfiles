#!/bin/sh

if [ ! -d "$HOME/.config" ]; then
  mkdir -p $HOME/.config
fi

for DIR in nvim
do
  ln -fs $PWD/$DIR $HOME/.config/$DIR
done
