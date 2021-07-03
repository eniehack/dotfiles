define(tmpl, `
    "$1")
        . "$script_dir/$1/install.sh"
        ;;')dnl
#!/bin/sh
set -eu

script_dir=$(dirname $0)

case "$1" in
tmpl(alacritty)dnl
tmpl(bspwm) dnl
tmpl(doom) dnl
tmpl(duplicity) dnl
tmpl(fish) dnl
tmpl(i3) dnl
tmpl(i3blocks) dnl
tmpl(mlterm) dnl
tmpl(neovim) dnl
tmpl(openbox) dnl
tmpl(org-protocol) dnl
tmpl(picom) dnl
tmpl(polybar) dnl
tmpl(sway) dnl
tmpl(sxhkd) dnl
tmpl(tmux) dnl
tmpl(waybar) dnl
tmpl(wofi) dnl
tmpl(zsh) dnl

    *)
        echo "not found"
        ;;
esac
