#!/usr/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

which fish || echo "no fish"

fc-list : family style | grep HackGen || echo "no HackGen Font"

-e ${XDG_CONFIG_HOME}/nvim || export $XDG_CONFIG_HOME="$HOME/.config" && mkdir ${XDG_CONFIG_HOME}/nvim/

which python || sudo pacman -S python
pip freeze | grep -q neovim || pip install --user neovim

ln -sf ${SCRIPT_DIR}/neovim/init.vim ${XDG_CONFIG_HOME}/nvim/init.vim
ln -sf ${SCRIPT_DIR}/neovim/dein.toml ~/dein.toml
ln -sf ${SCRIPT_DIR}/neovim/dein_lazy.toml ~/dein_lazy.toml
