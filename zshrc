# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### zgen

source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh

  zgen oh-my-zsh plugins/brew
  zgen oh-my-zsh plugins/command-not-found
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/github
  zgen oh-my-zsh plugins/macos
  zgen oh-my-zsh plugins/node
  zgen oh-my-zsh plugins/pip
  zgen oh-my-zsh plugins/python
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/yarn

  zgen load ascii-soup/zsh-url-highlighter
# zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train
  zgen load chrissicool/zsh-256color
  zgen load MichaelAquilina/zsh-auto-notify
  zgen load romkatv/powerlevel10k powerlevel10k
  zgen load sharat87/pip-app
  zgen load softmoth/zsh-vim-mode
  zgen load zsh-users/zsh-completions src
  zgen load zsh-users/zsh-syntax-highlighting

  zgen save
fi


### custom

for F in $HOME/.dotfiles/zsh/*.zsh; do
  source $F;
done

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Each window has own history
unsetopt inc_append_history
unsetopt share_history

