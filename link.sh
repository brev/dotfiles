#/bin/bash
for FILE in bashrc gitconfig inputrc profile
do
	ln -f -s ~/src/dotfiles/$FILE ~/.$FILE
done
