#!/bin/bash
# Upload external functions
	checkfile=/home/ed/scripts/external_func.sh
	[[ ! -f $checkfile ]] && echo -e "File $(basename -- "$checkfile") does not exist. Press any key to continue." && read -rsn1 && exit 5 || source $checkfile;
# Full system update
function updatenow() {
	yay -Sua --noconfirm
	exitcode=$?
	exitcontrol
}
# Send notification
function notifynownow() {
	iconerr=/home/ed/.local/share/icons/status/dialog-warning.svg
	iconst=/home/ed/.local/share/icons/status/trophy-gold.svg

	echo "Exit code = $exitcode | $codedescription | $(date) | AUR packages update has completed." \
	>> $HOME/.local/share/log-files/aur_update.log

	case $exitcode in
	 0)	notify-send -u normal -t 3000 'AUR packages update' 'Result: SUCCESS' -i $iconst && exit 0 ;;
	 *)	notify-send -u critical -t 3000 'AUR packages update' 'Result: ERROR' -i $iconerr && exit 1 ;;
	esac
}
#
updatenow
notifynownow
