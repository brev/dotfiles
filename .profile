if [ -f "$HOME/.zshrc" ]; then
  source "$HOME/.zshrc"
fi

if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi
