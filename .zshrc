setopt APPEND_HISTORY
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt NO_BEEP
setopt NO_CASE_GLOB
setopt NO_CHECK_JOBS
setopt NUMERIC_GLOB_SORT
setopt RC_EXPAND_PARAM

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' use-cache on

if [[ -e /usr/share/zsh/share/antigen.zsh ]]; then
  source /usr/share/zsh/share/antigen.zsh

  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle zsh-users/zsh-completions
  antigen bundle zsh-users/zsh-syntax-highlighting

  antigen apply
fi

export BROWSER=/usr/bin/firefox
export EDITOR=/usr/bin/nvim
export GOPATH=$HOME/.go
export GPG_TTY=$(tty)
export HISTFILE=~/.zhistory
export HISTSIZE=1000000
export LESS="-SRXF"
export NPM_CONFIG_PREFIX="$HOME/.local"
export PS1="%1~ "
export SAVEHIST=$HISTSIZE
export VISUAL=$EDITOR

path+=("$GOPATH/bin")
path+=("$HOME/.config/composer/vendor/bin")
path+=("$HOME/.local/bin")

alias grep='grep --colour=auto'
alias ls='ls --color=auto --human-readable'
alias sudo='sudo '
alias vi='nvim'
alias vim='nvim'

terminal=$(ps -p $(ps -p $$ -o ppid=) o args=)

if [ -z "$TMUX" ] && [ "$terminal" = '/usr/bin/alacritty' ]; then
  tmux attach || tmux
fi

source <(fzf --zsh)
