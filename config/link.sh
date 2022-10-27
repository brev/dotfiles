#!/bin/sh

if [ ! -d "$HOME/.config" ]; then
  mkdir -p $HOME/.config
fi

for DIR in lvim
do
  cd $DIR
  ./link.sh
  cd ..
done

