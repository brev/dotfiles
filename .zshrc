# omz update

# zsh profiling begin
#zmodload zsh/zprof

# zsh autosuggestion settings
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

# omz disable auto-updates for performance
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

# p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# antidote plugin manager
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

# zsh custom settings
for F in $HOME/.config/brev/zsh/*.zsh; do
  source $F;
done

# zsh profiling end
#zprof
