# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export EDITOR=/usr/bin/nvim
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export VISUAL=/usr/bin/nvim

setopt SHARE_HISTORY

alias http='http --verify=no'
alias l='ls -CF --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -alFh --color=auto'
alias sudo='sudo '
alias vi='nvim'
alias vim='nvim'
