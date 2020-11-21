#!/usr/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

which fish || echo "no fish"

# neovim
-e ${XDG_CONFIG_HOME}/nvim || export $XDG_CONFIG_HOME="$HOME/.config"

which python || sudo pacman -S python
pip freeze | grep -q neovim || pip install --user neovim

ln -s ${SCRIPT_DIR}/neovim/config ${XDG_CONFIG_HOME}/nvim

# alacritty
fc-list : family style | grep HackGen || echo "no HackGen Font"

-e ${XDG_CONFIG_HOME}/alacritty || mkdir -p ${XDG_CONFIG_HOME}/alacritty
ln -s ${SCRIPT_DIR}/alacritty/alacritty.yml ${XDG_CONFIG_HOME}/alacritty/aracritty.yml

#tmux
-e ${XDG_CONFIG_HOME}/tmux || mkdir -p ${XDG_CONFIG_HOME}/tmux
ln -s ${SCRIPT_DIR}/tmux/.tmux.conf ${XDG_CONFIG_HOME}/tmux/.tmux.conf
