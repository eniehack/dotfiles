eval "$(starship init zsh)"
bindkey -v

autoload -Uz promptinit
promptinit

autoload -U compinit
compinit

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt append_history
setopt share_history
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
