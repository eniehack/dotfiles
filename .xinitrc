#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets)
#export SSH_AUTH_SOCK

autocutsel -selection PRIMARY -fork &
autocutsel -fork &

urxvtd -q -o -f &
xrdb .Xresources &

exec tdm --xstart
