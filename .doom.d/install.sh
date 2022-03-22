#!/usr/bin/env sh
set -euo

SCRIPT_DIR=$(dirname "$0")
INSTALL_DIR="$HOME"/.doom.d/

mkdir -p "$INSTALL_DIR"
for f in "$SCRIPT_DIR"/*.el
do
    { filename=$(basename "$f")
      abspath=$(cd "$(dirname "$0")" && pwd)/"$filename"
      ln -s "$abspath" "$INSTALL_DIR"/"$filename"
    } &
done
