#!/usr/bin/env sh
set -euo

SCRIPT_DIR=$(dirname "$0")
XDG_CONFIG_HOME="$HOME"/.config
INSTALL_DIR="$XDG_CONFIG_HOME"/alacritty

fc-list : family style | grep HackGen || echo "no HackGen Font"

mkdir -p "$INSTALL_DIR"
ln -s "$SCRIPT_DIR"/alacritty.yml "$INSTALL_DIR"/alacritty.yml
