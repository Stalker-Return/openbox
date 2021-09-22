#!/bin/bash

# External source
source /home/ed/scripts/external_func.sh
#
sudo journalctl --vacuum-time=2weeks
exitcode=$?
exitcontrol
#
# log-file record
echo "Journal directory gas cleaned: $(date), exit code: $exitcode, $codedescription" >> $HOME/.local/share/log-files/clean_journal.log
#
# Send notification
case $exitcode in
 0 ) notify-send --urgency=normal --expire-time=3000 "Journal directory gas cleaned" ;;
 * ) notify-send --urgency=critical --expire-time=5000 "Journal directory cleaner error: $codedescription" ;;
esac
#
exit
