#!/bin/bash

ALSA=$(amixer -c 0 get Master | awk '/Mono: / {print $4 $6}' | sed 's/]\[/\ /g' | sed 's/\(\[\|\]\)//g')
VOL=$(echo "$ALSA" | awk '{print $1}')
MUTE=$(echo "$ALSA" | awk '{print $2}')

if [ $MUTE = "on" ]; then
    echo -e "\uf485$VOL"
else
    echo -e "\uf466$VOL"
fi
