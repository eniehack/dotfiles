#!/usr/bin/env sh
set -euo

SCRIPT_DIR=$(dirname "$0")
XDG_CONFIG_HOME="$HOME"/.config
INSTALL_DIR="$XDG_CONFIG_HOME"/tmux

#tmux
mkdir -p "$INSTALL_DIR"
ln -s "$SCRIPT_DIR"/.tmux.conf "$INSTALL_DIR"/.tmux.conf
