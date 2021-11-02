#!/bin/bash
# Upload external functions
checkfile=/home/ed/scripts/external_func.sh
[[ ! -f $checkfile ]] && echo -e "File $(basename -- "$checkfile") does not exist. Press any key to continue." && read -rsn1 && exit 5 || source $checkfile;
# Upload parameters
checkfile=/home/ed/scripts/backups.conf
[[ ! -f $checkfile ]] && echo -e "File $(basename -- "$checkfile") does not exist. Press any key to continue." && read -rsn1 && exit 5 || backup_list=$checkfile;
# Save files
function savefiles() {
	echo -ne "\033[5mCopy /home/ed/Clouds ... \e[0m"
	rsync -ar --delete /home/ed/Clouds "/run/media/ed/DATA"
	while read filename
		do
			clear
			echo -ne "\033[5mCopy $filename ... \e[0m"
			rsync -ar --delete $filename "/run/media/ed/DATA/Storage/Linux"
		done < $backup_list
}
#
savefiles
