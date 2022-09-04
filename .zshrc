#eval "$(starship init zsh)"
bindkey -v

autoload -Uz promptinit
promptinit

autoload -U compinit
compinit

#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt append_history
setopt share_history
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod g-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://z-shell.pages.dev/docs/gallery/collection
zicompinit # <- https://z-shell.pages.dev/docs/gallery/collection#minimal

export PNPM_HOME="/home/eniehack/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

#if [ -f "$HOME/.gpg-agent-info" ]; then
#    source "$HOME/.gpg-agent-info"
#    export GPG_AGENT_INFO
#    export SSH_AUTH_SOCK
#    export SSH_AGENT_PID
#else
#    eval $(gpg-agent --daemon --write-env-file "$HOME/.gpg-agent-info")
#fi
source /usr/share/nvm/init-nvm.sh
