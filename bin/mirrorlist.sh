#!/bin/bash
#
# External source
source /home/ed/scripts/external_func.sh
#
sudo reflector -f 10 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist
#sudo reflector -c Slovakia -a 6 --sort rate --save /etc/pacman.d/mirrorlist
#
exitcode=$?
exitcontrol
#
# log-file record
echo "Package cache has cleaned: $(date), exit code = $exitcode, $codedescription" >> $HOME/.local/share/log-files/mirrorlist.log
#
# Send notification
case $exitcode in
 0 ) notify-send --urgency=normal --expire-time=3000 "The mirrorlist has updated" ;;
 * ) notify-send --urgency=critical --expire-time=5000 "The mirrorlist updater error: $codedescription" ;;
esac
#
exit
