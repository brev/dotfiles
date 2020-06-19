### paths
export ARCHFLAGS="-arch x86_64"
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="/Users/brev/.pyenv:/usr/local/sbin:$PATH"

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
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain InitialKeyRepeat -int 14  # default 15
defaults write NSGlobalDomain KeyRepeat -int 1          # default 2

### vscodium
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false

### pyenv
eval "$(pyenv init -)"

### vi mode
bindkey -v
