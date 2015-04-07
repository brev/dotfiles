# git aliases

alias ga='git add'
alias gb='git branch'
alias gcheck='git checkout'
alias gclone='git clone'
alias gcom='git commit'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log'
alias gmerge='git merge'
alias gmv='git mv'
alias gpull='git pull'
alias gpush='git push'
alias grm='git rm'
alias grv='git remote -v'
alias gs='git status'
alias gso='git status | grep -v out/'


# git shell functions (advanced aliases)

function gupdates () {
  for INDEX in \
    "checkout master"       \
    "fetch origin"          \
    "fetch upstream"        \
    "pull origin master"    \
    "pull upstream master"  ;
  do
    echo ">>> git $INDEX"
    git $INDEX
  done
}

function gdiffs () {
  for INDEX in \
    "diff master origin/master"             \
    "diff master upstream/master"           \
    "diff origin/master upstream/master"    ;
  do
    echo ">>> git $INDEX"
    git $INDEX
  done
}
