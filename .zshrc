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

if [[ -e /opt/homebrew/share/antigen/antigen.zsh ]]; then
  source /opt/homebrew/share/antigen/antigen.zsh

  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle zsh-users/zsh-completions
  antigen bundle zsh-users/zsh-syntax-highlighting

  antigen apply
fi

HERD="$HOME/Library/Application Support/Herd/config/php"

export EDITOR=/opt/homebrew/bin/nvim
export GOPATH=$HOME/.go
export GPG_TTY=$(tty)
export HERD_PHP_74_INI_SCAN_DIR="$HERD/74/"
export HERD_PHP_80_INI_SCAN_DIR="$HERD/80/"
export HERD_PHP_81_INI_SCAN_DIR="$HERD/81/"
export HERD_PHP_82_INI_SCAN_DIR="$HERD/82/"
export HERD_PHP_83_INI_SCAN_DIR="$HERD/83/"
export HERD_PHP_84_INI_SCAN_DIR="$HERD/84/"
export HISTFILE=~/.zhistory
export HISTSIZE=1000000
export LESS="-SRXF --tabs 2"
export NPM_CONFIG_PREFIX="$HOME/.local"
export PS1="%1~ "
export SAVEHIST=$HISTSIZE
export VISUAL=$EDITOR

path+=("$HOME/.composer/vendor/bin")
path+=("$HOME/Library/Application Support/Herd/bin/")
path+=("$GOPATH/bin")

alias grep='grep --colour=auto'
alias ls='ls -h --color=auto'
alias sudo='sudo '
alias vi='nvim'
alias vim='nvim'

source <(fzf --zsh)

