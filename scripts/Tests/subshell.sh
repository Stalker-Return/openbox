#!/bin/bash

spinner() {        ##### Animation while scanning for available networks #####
sleep 2
echo -e "[${Green}wlan0mon${White}] Preparing for scan..."
sleep 3
spin='/-\|'
length=${#spin}
while sleep 0.1; do
echo -ne "[${Green}wlan0mon${White}] Scanning for available networks...${spin:i--%length:1}" "\r"
done
}

spinner &
sudo pacman -S pcmanfm --noconfirm > /dev/null
killall spinner
exit
