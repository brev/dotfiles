#/bin/bash
for FILE in ackrc bashrc gitconfig inputrc profile
do
	ln -f -s ~/src/dotfiles/$FILE ~/.$FILE
done
