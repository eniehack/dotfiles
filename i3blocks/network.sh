#!/bin/bash

if [[ -z $INTERFACE ]] ; then
    INTERFACE=$(ip route | awk '/^default/ {print $5; exit}')
fi

[[ -z $INTERFACE ]] && exit

if [[ -n "$(iw dev $INTERFACE link | awk '{ print $1 }' | grep -E -o 'Not')" ]] ; then
    echo -e "\uf1eb disconnect"
    echo "#ff0000"
else
    echo -e "\uf1eb $(iw dev $INTERFACE link | awk '/SSID:/ {print $2}')"
    echo "#008800"
fi

exit 0
