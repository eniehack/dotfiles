#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets)
#export SSH_AUTH_SOCK
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

autocutsel -selection PRIMARY -fork &
autocutsel -fork &
/usr/bin/urxvtd -q -o -f

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec tdm --xstart
