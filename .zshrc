setopt appendhistory
setopt autocd
setopt extendedglob
setopt histignorealldups
setopt histignorespace
setopt inc_append_history
setopt nobeep
setopt nocaseglob
setopt nocheckjobs
setopt numericglobsort
setopt rcexpandparam

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' use-cache on

if [[ -e /usr/share/zsh/share/antigen.zsh ]]; then
  source /usr/share/zsh/share/antigen.zsh

  antigen bundle docker
  antigen bundle docker-compose
  antigen bundle fzf
  antigen bundle git-auto-fetch
  antigen bundle ripgrep
  antigen bundle rsync
  antigen bundle z
  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle zsh_reload

  antigen bundle arzzen/calc.plugin.zsh

  antigen apply
fi

export BROWSER=/usr/share/google-chrome
export EDITOR=/usr/bin/nvim
export GOPATH=$HOME/.go
export GPG_TTY=$(tty)
export HISTFILE=~/.zhistory
export HISTSIZE=1000000
export LESS="-SRXF"
export PS1="%1~ "
export SAVEHIST=$HISTSIZE
export VISUAL=$EDITOR

path+=("$GOPATH/bin")
path+=("$HOME/.config/composer/vendor/bin")

alias grep='grep --colour=auto'
alias ls='ls --color=auto'
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias sudo='sudo '
alias vi='nvim'
alias vim='nvim'

terminal=$(ps -p $(ps -p $$ -o ppid=) o args=)

if [ -z "$TMUX" ] && [ "$terminal" = '/usr/bin/alacritty' ]; then
  tmux attach || tmux
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
