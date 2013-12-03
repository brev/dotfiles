#/bin/bash
for FILE in bashrc inputrc profile
do
	ln -f -s ~/.dotfiles/$FILE ~/.$FILE
done
