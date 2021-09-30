#!/bin/sh

# This script displays battery icon according to the charge level and charging state

# Author: Piotr Miller
# e-mail: nwg.piotr@gmail.com
# Website: http://nwg.pl
# Project: https://github.com/nwg-piotr/tint2-executors
# License: GPL3

# Dependencies: `acpi`

bat=$(acpi -b)
state=$(echo ${bat} | awk '{print $3}')

if [[ "$state" = "Not" ]]; then
    level=$(echo ${bat} | awk '{print $5}')
    level=${level::-1}

else
    level=$(echo ${bat} | awk '{print $4}')
    if [[ "$state" == *"Unknown"* ]]; then
        level=${level::-1}
    else
        if [[ "$level" == "100%" ]]; then
          level=${level::-1}
        else
          level=${level::-2}
        fi
    fi
fi

if [[ "$bat" == *"until"* ]]; then

    if [[ "$level" -ge "95" ]]; then
        echo /usr/share/icons/Papirus/16x16/panel/keyboard-battery-full.svg
    elif [[ "$level" -ge "75" ]]; then
        echo /usr/share/icons/Papirus/16x16/panel/keyboard-battery-good.svg
    elif [[ "$level" -ge "35" ]]; then
        echo /usr/share/icons/Papirus/16x16/panel/keyboard-battery-medium.svg
    elif [[ "$level" -ge "15" ]]; then
        echo /usr/share/icons/Papirus/16x16/panel/keyboard-battery-low.svg
    else
        echo /usr/share/icons/Papirus/16x16/panel/keyboard-battery-empty.svg
    fi
else
    if [[ "$level" -ge "95" ]]; then
        echo /usr/share/icons/Papirus/16x16/panel/keyboard-battery-full.svg
    elif [[ "$level" -ge "75" ]]; then
        echo /usr/share/icons/Papirus/16x16/panel/keyboard-battery-good.svg
    elif [[ "$level" -ge "35" ]]; then
        echo /usr/share/icons/Papirus/16x16/panel/keyboard-battery-medium.svg
    elif [[ "$level" -ge "15" ]]; then
        echo /usr/share/icons/Papirus/16x16/panel/keyboard-battery-low.svg
    else
        echo /usr/share/icons/Papirus/16x16/panel/keyboard-battery-empty.svg
    fi
fi
if  [[ $1 = "-l" ]]; then
    echo ${level}%
fi
