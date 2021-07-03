#!/bin/sh

set -eu

mkdir -p "$XDG_CONFIG_HOME/wofi"

for i in *
do 
    ln -s "$(pwd)/$i" "$XDG_CONFIG_HOME/wofi/$i"
done
