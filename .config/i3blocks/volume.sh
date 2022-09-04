#!/bin/bash

#ALSA=$(amixer -c 0 get Master | awk '/Mono: / {print $4 $6}' | sed 's/]\[/\ /g' | sed 's/\(\[\|\]\)//g')
VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '/Volume: / { print $5}')
#VOL=$(echo "$ALSA" | awk '{print $1}')
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '/Mute: / { print $2 }')
#MUTE=$(echo "$ALSA" | awk '{print $2}')

echo -e "\uf485$VOL"

if [ $MUTE = "on" ]; then
    echo "#6272a4"
fi

exit 0
