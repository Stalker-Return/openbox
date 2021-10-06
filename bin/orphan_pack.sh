#!/bin/bash
# External source
checkfile=/home/ed/scripts/external_func.sh
[[ ! -f $checkfile ]] && echo -e "File $(basename -- "$checkfile") does not exist. Press any key to continue." && read -rsn1 && exit 5 || source $checkfile;
# Clean orphan packages
function cleanorphan() {
	sudo pacman -Rns --noconfirm $(pacman -Qtdq)
	exitcode=$?
	exitcontrol
}
# Send notifications:
function notifynownow() {
	iconerr=/home/ed/.local/share/icons/status/dialog-warning.svg
	iconst=/home/ed/.local/share/icons/status/trophy-gold.svg

	echo "Orphan packages has cleaned: $(date), exit code = $exitcode, $codedescription" \
	>> $HOME/.local/share/log-files/orphan_pac.log

	case $exitcode in
	 0)	notify-send -u normal -t 3000 'Orphan packages has cleaned' 'Result: SUCCESS' -i $iconst && exit 0 ;;
	 *)	notify-send -u critical -t 3000 'Orphan packages cleaner' 'Result: ERROR' -i $iconerr && exit 1 ;;
	esac
}
#
function notifynowempty() {
	iconerr=/home/ed/.local/share/icons/status/dialog-warning.svg
	iconst=/home/ed/.local/share/icons/status/trophy-gold.svg

	echo "Orphan Packages have not found: $(date), exit code = $exitcode, $codedescription" \
	>> $HOME/.local/share/log-files/orphan_pac.log

	case $exitcode in
	 0)	notify-send -u normal -t 3000 'Orphan Packages have not found' 'Result: SUCCESS' -i $iconst && exit 0 ;;
	 *)	notify-send -u critical -t 3000 'Orphan Packages have not found' 'Result: ERROR' -i $iconerr && exit 1 ;;
	esac
}
#
[[ -z $(pacman -Qtdq) ]] && { exitcode=$?; exitcontrol; notifynowempty; } || { cleanorphan; notifynownow; }
#
exit
