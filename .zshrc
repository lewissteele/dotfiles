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

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/zsh-antigen/antigen.zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

export EDITOR=/usr/local/bin/nvim
export GOPATH=$HOME/.go
export GPG_TTY=$(tty)
export HISTFILE=~/.zhistory
export HISTSIZE=1000000
export LESS="-SRXF --tabs 2"
export PHP_INI_SCAN_DIR="$HOME/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export PROMPT="%B%1~ %b"
export SAVEHIST=$HISTSIZE
export VISUAL=$EDITOR

path+=("$HOME/.config/herd-lite/bin")
path+=("$HOME/.deno/bin")

alias grep='grep --colour=auto'
alias ls='ls -h --color=auto'
alias sudo='sudo '
alias vi='nvim'
alias vim='nvim'
