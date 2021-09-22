#!/bin/bash

# External source
source /home/ed/scripts/external_func.sh
#
yay -Yc --noconfirm
exitcode=$?
exitcontrol
#
# log-file record
echo "Unwanted dependancies has cleaned: $(date), exit code = $exitcode, $codedescription" >> $HOME/.local/share/log-files/unwanted_dep.log
#
# Send notification
case $exitcode in
 0 ) notify-send --urgency=normal --expire-time=3000 "Unwanted dependancies has cleaned" ;;
 * ) notify-send --urgency=critical --expire-time=5000 "Unwanted dependancies cleaner error: $codedescription" ;;
esac
#
exit
