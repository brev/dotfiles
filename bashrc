echo "bashrc"

for F in $HOME/src/dotfiles/bashrcs/*; do
  source $F;
done
