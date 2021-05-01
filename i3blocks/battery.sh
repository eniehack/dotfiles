#!/bin/bash

BAT=$(acpi -b | awk -F'[,]' '{print $2}' | sed -r "s/%//g")
CHARGING=$(acpi -b | awk -F'[: ,]' '{print $4}')

if [ "$CHARGING" = "Charging" ]; then
    echo -e "\uf0e7$BAT%"
elif [ "$BAT" -le 10 ]; then
    echo -e "\uf582$BAT%"
elif [ "$BAT" -le 20 ]; then
    echo -e "\uf57a$BAT%"
elif [ "$BAT" -le 50 ]; then
    echo -e "\uf57d$BAT%"
elif [ "$BAT" -le 75 ]; then
    echo -e "\uf580$BAT%"
else
    echo -e "\uf578$BAT%"
fi

if [ "$BAT" -le 5 ]; then
    echo "#ff0000"
elif [ "$BAT" -le 20 ]; then
    echo "#ff8c00"
else
    echo "#008000"
fi

exit 0
