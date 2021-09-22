#/bash/bin

# echo -e "" " $(top -bn1 | grep Cpu | awk '{print $2}')%"
echo -e "$(top -bn1 | grep Cpu | awk '{print " "$2}')%"
