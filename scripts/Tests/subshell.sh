#!/bin/bash

echo "<img>/usr/share/icons/Papirus/16x16/status/package-installed-updated.svg</img>"
declare -i cpuFreq
cpuFreq=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq | cut -f3 -d" " | cut -f1 -d".")

if [ $cpuFreq -ge 1000 ]
then
  cpu=$(echo $cpuFreq | cut -c1).$(echo $cpuFreq | cut -c2)GHz
else
  cpu=${cpuFreq}MHz
fi

echo "<txt>"$(cat /sys/devices/virtual/thermal/thermal_zone0/temp  | awk ' { print $1 / 1000 }' | sed 's/\ \ */ /g' | cut -f2 -d" ")" C</txt>"
echo "<tool>Freq: "$cpu"</tool>"
