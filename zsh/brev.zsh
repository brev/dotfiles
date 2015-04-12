### path

export PATH=/System/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/local/bin:/usr/local/sbin:$PATH


### exports

export CLICOLOR=1
export EDITOR='subl -w'
export JAVA_HOME=$(/usr/libexec/java_home)
export RBENV_ROOT=/usr/local/var/rbenv

unset LSCOLORS


### aliases

# dir quick shortcuts
alias f='cd ~/src/fluxible-test'
alias g='cd ~/src/products/grok'
alias n='cd ~/src/numenta.com'
alias o='cd ~/src/numenta.org'

# general
alias grep='grep --color=auto'

# adobe tools open quick from CLI
alias ill='open -a /Applications/Adobe\ Illustrator\ CC\ 2014/Adobe\ Illustrator.app/Contents/MacOS/Adobe\ Illustrator'
alias psd='open -a /Applications/Adobe\ Photoshop\ CC\ 2014/Adobe\ Photoshop\ CC\ 2014.app/Contents/MacOS/Adobe\ Photoshop\ CC\ 2014'


### mac os x

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.sublimetext ApplePressAndHoldEnabled -bool false
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain InitialKeyRepeat -int 14  # default 15
defaults write NSGlobalDomain KeyRepeat -int 1          # default 2
