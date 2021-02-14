#!/usr/bin/env sh
set -euo

SCRIPT_DIR=$(dirname "$0")
INSTALL_DIR="$HOME"

for f in "$SCRIPT_DIR"/.zsh*
do
    { filename=$(basename "$f")
      abspath=$(cd "$(dirname "$0")" && pwd)/"$filename"
      ln -s "$abspath" "$INSTALL_DIR"/"$filename"
      } &
done
