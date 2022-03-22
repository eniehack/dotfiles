#!/bin/sh
set -eu

mkdir -p "$XDG_CONFIG_HOME/waybar"

for i in *
do
    ln -s "$(pwd)/$i" "$XDG_CONFIG_HOME/waybar/$i"
done
