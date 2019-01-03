### paths

export PATH=/usr/local/opt/python/libexec/bin:/usr/local/opt/python@2/libexec/bin:/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.6.0/bin:/usr/local/bin:/usr/local/sbin:$PATH
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export GEM_HOME="/usr/local/lib/ruby/gems/2.6.0"
export GEM_PATH="/usr/local/lib/ruby/gems/2.6.0"
export JAVA_HOME=$(/usr/libexec/java_home)
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"


### exports

export CLICOLOR=1
export EDITOR=vi
export KEYTIMEOUT=1

unset LSCOLORS


### aliases

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

