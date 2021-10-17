#!/bin/bash
# Upload external functions
	checkfile=/home/ed/scripts/external_func.sh
	[[ ! -f $checkfile ]] && echo -e "File $(basename -- "$checkfile") does not exist. Press any key to continue." && read -rsn1 && exit 5 || source $checkfile;
# Rid off unwanted dependancies
function unwanted() {
	yay -Yc --noconfirm
	exitcode=$?
	exitcontrol
}
# Send notification
function notifynownow() {
	iconerr=/home/ed/.local/share/icons/status/dialog-warning.svg
	iconst=/home/ed/.local/share/icons/status/trophy-gold.svg

	echo "Exit code = $exitcode | $codedescription | $(date) | Unwanted dependancies has cleaned." \
	>> $HOME/.local/share/log-files/unwanted_dep.log

	case $exitcode in
	 0)	notify-send -u normal -t 3000 'Clean Unwanted Dependancies.' 'Result: SUCCESS' -i $iconst && exit 0 ;;
	 *)	notify-send -u critical -t 3000 'Clean Unwanted Dependancies.' 'Result: ERROR' -i $iconerr && exit 1 ;;
	esac
}
#
unwanted
notifynownow
