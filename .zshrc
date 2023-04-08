setopt appendhistory
setopt autocd
setopt correct
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

export ANDROID_HOME=$HOME/.android-sdk
export BROWSER=/usr/local/bin/chromium
export DENO_INSTALL=$HOME/.deno
export EDITOR=/usr/bin/nvim
export GDK_SCALE=1.25
export GOPATH=$HOME/.go
export HISTFILE=~/.zhistory
export HISTSIZE=1000000
export LESS="-SRXF"
export MOZ_USE_XINPUT2=1
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"
export N_PRESERVE_COREPACK=1
export N_PRESERVE_NPM=1
export PS1="%1~ "
export SAVEHIST=$HISTSIZE
export VISUAL=$EDITOR
export WORDCHARS=${WORDCHARS//\/[&.;]}

path+=("$ANDROID_HOME/emulator")
path+=("$ANDROID_HOME/platform-tools")
path+=("$ANDROID_HOME/tools")
path+=("$ANDROID_HOME/tools/bin")
path+=("$DENO_INSTALL/bin")
path+=("$GOPATH/bin")
path+=("$HOME/.config/composer/vendor/bin")
path+=("$HOME/.linuxbrew/bin")
path+=("$HOME/.yarn/bin")

alias i3lock='i3lock -c 000000 -n'
alias j='z'
alias l='ls -CF --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -alFh --color=auto'
alias ls='ls --color=auto'
alias mutt='neomutt'
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias sudo='sudo '
alias vi='nvim'
alias vim='nvim'

terminal=$(ps -p $(ps -p $$ -o ppid=) o args=)

if [ -z "$TMUX" ] && [ "$terminal" = 'alacritty' ]; then
  tmux attach || tmux
fi
