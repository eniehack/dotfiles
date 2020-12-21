#!/bin/bash

ACPI=$(acpi -b)
BAT=$(echo $ACPI | awk -F'[,]' '{print $2}' | sed -r "s/([0-9]+)%,/\1/g")
CHARGING=$(echo $ACPI | awk -F'[: ,]' '{print $4}')

echo -e "\uf243$BAT ($CHARGING)"

if [ $BAT -le 5] ; then
    echo "#ff0000"
elif [ $BAT -le 20] ; then
    echo "#ff8c00"
else
    echo "#008000"
fi

exit 0
