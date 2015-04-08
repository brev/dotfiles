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
  CMDS=(                        \
    'git checkout master'       \
    'git fetch origin'          \
    'git fetch upstream'        \
    'git pull origin master'    \
    'git pull upstream master'  \
  )

  for INDEX in $CMDS; do
    echo ">>> $INDEX"
    eval ${INDEX}
  done
}

function gdiffs () {
  CMDS=(                                      \
    'git diff master origin/master'           \
    'git diff master upstream/master'         \
    'git diff origin/master upstream/master'  \
  )

  for INDEX in $CMDS; do
    echo ">>> $INDEX"
    eval ${INDEX}
  done
}
