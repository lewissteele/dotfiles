if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

if [[ -e ~/.linuxbrew/share/antigen/antigen.zsh ]]; then
  source ~/.linuxbrew/share/antigen/antigen.zsh

  antigen bundle docker
  antigen bundle docker-compose
  antigen bundle fzf
  antigen bundle git-auto-fetch
  antigen bundle ripgrep
  antigen bundle rsync
  antigen bundle z
  antigen bundle zsh_reload

  antigen apply
fi

path+=("$HOME/.linuxbrew/bin")
path+=("$HOME/go/bin")

export EDITOR=/usr/bin/nvim
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
export VISUAL=$EDITOR

alias l='ls -CF --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -alFh --color=auto'
alias ls='ls --color=auto'
alias sudo='sudo '
alias vi='nvim'
alias vim='nvim'
