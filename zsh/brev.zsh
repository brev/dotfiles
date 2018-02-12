### paths

export NVM_DIR=~/.nvm
export PATH=/usr/local/opt/python/libexec/bin:/usr/local/bin:/usr/local/sbin:$PATH

### exports

export CLICOLOR=1
export EDITOR=atom
export JAVA_HOME=$(/usr/libexec/java_home)
export KEYTIMEOUT=1

unset LSCOLORS


### aliases

# general
alias grep='grep --color=auto'


### mac os x

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain InitialKeyRepeat -int 14  # default 15
defaults write NSGlobalDomain KeyRepeat -int 1          # default 2


### nvm

export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh
