#!/bin/sh
set -eu

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
DEST_DIR="$XDG_CONFIG_HOME/i3blocks"

mkdir -p $DEST_DIR

for i in battery.sh config forecast.sh network.sh volume.sh
do
    ln -s "$(pwd)/$i" "$DEST_DIR/$i"
done
