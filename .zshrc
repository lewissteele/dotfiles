if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export EDITOR=/usr/bin/nvim
export GOPATH=$HOME/.go
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
export VISUAL=$EDITOR

path+=("$GOPATH/bin")
path+=("$HOME/.composer/vendor/bin")

alias l='ls -CF --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -alFh --color=auto'
alias ls='ls --color=auto'
alias sudo='sudo '
alias vi='nvim'
alias vim='nvim'
