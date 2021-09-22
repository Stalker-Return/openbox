#!/bin/bash
#
# External source
source /home/ed/scripts/external_func.sh
#
( echo "y"; echo "y"; echo "y" ) | yay -Scc
exitcode=$?
exitcontrol
#
# log-file record
echo "Package cache has cleaned: $(date), exit code = $exitcode, $codedescription" >> $HOME/.local/share/log-files/pac_cache.log
#
# Send notification
case $exitcode in
 0 ) notify-send --urgency=normal --expire-time=3000 "Package cache has cleaned" ;;
 * ) notify-send --urgency=critical --expire-time=5000 "Package cache cleaner error: $codedescription" ;;
esac
#
exit
