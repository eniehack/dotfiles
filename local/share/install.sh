#!/bin/sh
set -eu

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
DIST_DIR="$XDG_DATA_HOME/applications"

mkdir -p "$DIST_DIR"

ln -s "$(pwd)/org-protocol.desktop" "$DIST_DIR/org-protocol.desktop"
cat "$(pwd)/mimeapps.list" >>"$DIST_DIR/mimeapps.list"

update-desktop-database "$DIST_DIR"
