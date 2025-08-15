# git
git config --global color.branch auto
git config --global color.diff auto
git config --global color.status auto
git config --global core.whitespace trailing-space,space-before-tab
git config --global http.postBuffer 157286400
git config --global init.defaultBranch main
git config --global pager.diff true
git config --global pull.ff only

# aliases
alias gcob="git checkout -b"
alias glu="git pull upstream"
alias gpud="git push upstream --delete"
alias gpum="git push upstream \$(git_main_branch)"
alias grp="git remote prune"
alias grpu="git remote prune upstream"
