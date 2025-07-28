### main

# paths
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="/usr/local/opt/flex/bin:$PATH"

# flags
export CPPFLAGS="-I/usr/local/opt/flex/include $CPPFLAGS"
export CXXFLAGS="-I/usr/local/opt/flex/include $CXXFLAGS"
export LDFLAGS="-L/usr/local/opt/bison/lib $LDFLAGS"
export LDFLAGS="-L/usr/local/opt/flex/lib $LDFLAGS"

# settings
export CLICOLOR=1
export EDITOR=nvim
export KEYTIMEOUT=1
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
set -g default-terminal "xterm-256color"
unset LSCOLORS

# system
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain InitialKeyRepeat -int 14  # default 15
defaults write NSGlobalDomain KeyRepeat -int 1          # default 2

# aliases
alias grep="grep --color=auto"
alias vi="nvim"
alias vim="nvim"

