#!/bin/sh

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

mkdir -p "$XDG_CONFIG_HOME/sway"
mkdir -p "$HOME/.local/bin"

ln -s "$(pwd)/config" "$XDG_CONFIG_HOME/sway/config"
ln -s "$(pwd)/env" "$XDG_CONFIG_HOME/sway/env"
ln -s "$(pwd)/sway" "$HOME/.local/bin/sway"
