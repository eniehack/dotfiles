
#!/usr/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
XDG_CONFIG_HOME="$HOME/.config"

# alacritty
which_result=0
output=$(which alacritty) || result=$?
fc-list : family style | grep HackGen || echo "no HackGen Font"

-e ${XDG_CONFIG_HOME}/alacritty || mkdir -p ${XDG_CONFIG_HOME}/alacritty
ln -s ${SCRIPT_DIR}/alacritty/alacritty.yml ${XDG_CONFIG_HOME}/alacritty/aracritty.yml

#tmux
-e ${XDG_CONFIG_HOME}/tmux || mkdir -p ${XDG_CONFIG_HOME}/tmux
ln -s ${SCRIPT_DIR}/tmux/.tmux.conf ${XDG_CONFIG_HOME}/tmux/.tmux.conf
