alias vim='nvim'

# Copied Ubuntu ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ls colours for mac
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias tmux="TERM=screen-256color-bce tmux"

if [ -f $HOME/.aws_credentials ]; then
  source $HOME/.aws_credentials
fi

