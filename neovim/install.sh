#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(dirname "$0")
XDG_CONFIG_HOME="$HOME"/.config

mkdir -p "$XDG_CONFIG_HOME"/nvim
ln -s "$SCRIPT_DIR"/neovim/config "$XDG_CONFIG_HOME"/nvim
for f in "$SCRIPT_DIR"/neovim/dein*
do
    { filename=$(basename "$f")
      abspath=$(cd "$(dirname "$0")" && pwd)/"$filename"
      ln -s "$abspath" "$HOME/$filename"
    } &
done
