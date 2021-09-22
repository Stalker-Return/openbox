#!/bin/bash

# External source
source /home/ed/scripts/external_func.sh
#
sudo pacman -Rns --noconfirm $(pacman -Qtdq)
exitcode=$?
exitcontrol
# ( echo "y" ) | sudo pacman -Rns $(pacman -Qtdq)
#
# log-file record
echo "Orphan packages has cleaned: $(date), exit code = $exitcode, $codedescription" >> $HOME/.local/share/log-files/orphan_pac.log
#
# Send notification
case $exitcode in
 0 ) notify-send --urgency=normal --expire-time=3000 "Orphan packages has cleaned" ;;
 * ) notify-send --urgency=critical --expire-time=5000 "Orphan packages cleaner error: $codedescription" ;;
esac
#
exit
