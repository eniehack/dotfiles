#!/usr/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ ! -e ${XDG_CONFIG_HOME}/nvim ]; then
	mkdir ${XDG_CONFIG_HOME}/nvim/
fi

which python
if [ ! $? = 0 ]; then
	sudo pacman -S python
fi

pip freeze | grep -q neovim
if [ ! $? = 0 ]; then
	pip install --user neovim
fi
	

ln -sf ${SCRIPT_DIR}/neovim/init.vim ${XDG_CONFIG_HOME}/nvim/init.vim
ln -sf ${SCRIPT_DIR}/neovim/dein.toml ~/dein.toml
ln -sf ${SCRIPT_DIR}/neovim/dein_lazy.toml ~/dein_lazy.toml
