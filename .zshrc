if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

export ANDROID_HOME=$HOME/.android-sdk
export EDITOR=/usr/bin/nvim
export GDK_SCALE=1
export GOPATH=$HOME/.go
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
export VISUAL=$EDITOR

path+=("$ANDROID_HOME/emulator")
path+=("$ANDROID_HOME/platform-tools")
path+=("$ANDROID_HOME/tools")
path+=("$ANDROID_HOME/tools/bin")
path+=("$GOPATH/bin")
path+=("$HOME/.linuxbrew/bin")

alias i3lock='i3lock -c 000000 -n'
alias j='z'
alias l='ls -CF --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -alFh --color=auto'
alias ls='ls --color=auto'
alias sudo='sudo '
alias vi='nvim'
alias vim='nvim'

if [ -z "$TMUX" ]; then
  tmux attach || tmux
fi
