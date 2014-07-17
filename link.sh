#/bin/bash
for FILE in ackrc bashrc gitconfig inputrc profile
do
	ln -f -s ~/src/dotfiles/$FILE ~/.$FILE
done

for DIR in iterm2 sublime
do
  cd $DIR
  ./link.sh
  cd ..
done
