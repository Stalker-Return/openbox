#!/bin/bash
# Upload external functions
checkfile=/home/ed/scripts/external_func.sh
[[ ! -f $checkfile ]] && echo -e "File $(basename -- "$checkfile") does not exist. Press any key to continue." && read -rsn1 && exit 5 || source $checkfile;
#
function savefiles() {
rsync -ar --delete /home/ed/Clouds "/run/media/ed/TOSHIBA EXT"
rsync -ar --delete /home/ed/Music "/run/media/ed/TOSHIBA EXT/Storage/Linux"
rsync -ar --delete /home/ed/Pictures "/run/media/ed/TOSHIBA EXT/Storage/Linux"
rsync -ar --delete /home/ed/Documents "/run/media/ed/TOSHIBA EXT/Storage/Linux"
rsync -ar --delete /home/ed/Downloads "/run/media/ed/TOSHIBA EXT/Storage/Linux"
rsync -ar --delete /home/ed/scripts "/run/media/ed/TOSHIBA EXT/Storage/Linux"
rsync -ar --delete /home/ed/bin "/run/media/ed/TOSHIBA EXT/Storage/Linux"
rsync -ar --delete /home/ed/portable "/run/media/ed/TOSHIBA EXT/Storage/Linux"
rsync -ar --delete /home/ed/Templates "/run/media/ed/TOSHIBA EXT/Storage/Linux"
rsync -ar --delete /home/ed/.local "/run/media/ed/TOSHIBA EXT/Storage/Linux"
rsync -ar --delete /home/ed/.config "/run/media/ed/TOSHIBA EXT/Storage/Linux"
rsync -ar --delete /home/ed/.bashrc "/run/media/ed/TOSHIBA EXT/Storage/Linux"
rsync -ar --delete /home/ed/.xprofile "/run/media/ed/TOSHIBA EXT/Storage/Linux"
rsync -ar --delete /home/ed/.xinitrc "/run/media/ed/TOSHIBA EXT/Storage/Linux"
rsync -ar --delete /home/ed/.fehbg "/run/media/ed/TOSHIBA EXT/Storage/Linux"
rsync -ar --delete /home/ed/.setbg "/run/media/ed/TOSHIBA EXT/Storage/Linux"
rsync -ar --delete /home/ed/.Xresources "/run/media/ed/TOSHIBA EXT/Storage/Linux"
rsync -ar --delete /home/ed/README.md "/run/media/ed/TOSHIBA EXT/Storage/Linux"
}
echo -ne "Backup in progress... "
savefiles
