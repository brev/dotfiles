
### exports

export LS_COLORS="di=01;35"


### aliases

alias grep='grep --color=auto'
alias ls='ls --color=auto $LS_OPTIONS'
alias vi='vim'


### ssh agent

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
  echo "Initialising new SSH agent..."
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  ssh-add "$HOME/.ssh/id_rsa_nearlygod_brev"
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
  else
    start_agent;
fi

