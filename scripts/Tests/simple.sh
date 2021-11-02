#!/bin/bash
<< COMM
tput civis
echo -e "\033[5mNetwork Parameters\033[0m"
tput setaf 10
iw dev | grep ssid | awk '{print $2}'
curl -s http://myip.enix.org/REMOTE_ADDR
echo -e "\n"
tput setaf 15
read -rsn1 -p "Press any key to exit... "
COMM

# xterm -bg gray9 -fg snow -T Wi-Fi -geometry 43x20+1103+479 -e 'tput civis; echo -e "\033[5mAvailable Wi-Fi\033[0m"; tput setaf 10; sudo iw dev wlp3s0 scan | grep SSID; echo -e "\n"; tput setaf 15; read -rsn1 -p "Press any key to exit... "'

xterm -bg gray9 -fg snow -T Wi-Fi -geometry 43x20+1103+479 -e 'tput civis; echo -e "\033[5mAvailable Wi-Fi\033[0m"; tput setaf 10; iw dev | grep ssid | awk '{print $2}'; echo -e "\n"; tput setaf 15; read -rsn1 -p "Press any key to exit... "'
