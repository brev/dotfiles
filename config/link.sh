#!/bin/sh

if [ ! -d "$HOME/.config" ]; then
  mkdir -p $HOME/.config
fi

for DIR in lvim nvim
do
  cd $DIR
  ./link.sh
  cd ..
done

#for DIR in nvim
#do
#  ln -fns $PWD/$DIR $HOME/.config/$DIR
#done
