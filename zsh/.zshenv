export EDITOR="$(which nvim)"
#XDG Base Directory settings
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# pkg-config
export PKG_CONFIG_PATH="/usr/lib/pkgconfig"

# Golang
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Crystal
#export PATH="$PATH:$HOME/scry/bin"

# Ruby
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# Android SDK
export _JAVA_AWT_WM_NONREPARENTING=1

# Doom Emacs
export PATH="$PATH:$HOME/.emacs.d/bin"

alias vimdiff="nvim -d"
alias ec="emacsclient -t"
export AUR_PAGER=nnn
