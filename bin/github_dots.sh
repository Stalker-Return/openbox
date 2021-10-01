#!/bin/sh
# Upload external functions
checkfile=/home/ed/scripts/external_func.sh
[[ ! -f $checkfile ]] && echo -e "File $(basename -- "$checkfile") does not exist. Press any key to continue." && read -rsn1 && exit 5 || source $checkfile;
#
# Update GIT-folder
function githubupdate() {
# GIT ADD
summctrl=0
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add \
.bashrc .xprofile .xinitrc .fehbg .setbg .xscreensaver README.md .Xresources scripts/ bin/ Templates/ \
.local/share/icons/ .local/share/log-files/ .local/share/wallpapers/ .local/share/applications/ .local/share/nyxt/ \
.config/mimeapps.list .config/pavucontrol.ini \
.config/geany/ .config/gtk-2.0/ .config/gtk-3.0/ .config/lxterminal/ .config/libreoffice/ .config/pulse/ \
.config/lxpanel/ .config/lxsession/ .config/dunst/ .config/doublecmd/ .config/lxsession-default-apps/ \
.config/systemd/ .config/tint2/ .config/powerkit/ .config/openbox/ .config/pcmanfm/ .config/alacritty/ \
.config/Thunar/ .config/FreeFileSync/ .config/nyxt/ .config/conky/ .config/i3/
exitcode=$?
exitcontrol
codedescription1=$codedescription
exitcode1=$exitcode
summctrl=$(expr $summctrl + $exitcode1)
# GIT COMMIT
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -m "Dayly upload"
exitcode=$?
exitcontrol
codedescription2=$codedescription
exitcode2=$exitcode
summctrl=$(expr $summctrl + $exitcode2)
# GIT PUSH
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push -u
exitcode=$?
exitcontrol
codedescription3=$codedescription
exitcode3=$exitcode
summctrl=$(expr $summctrl + $exitcode3)
}
#
# Send notification
function notifynownow() {
	iconerr=/home/ed/.local/share/icons/status/dialog-warning.svg
	iconst=/home/ed/.local/share/icons/status/trophy-gold.svg

	echo "Github .dotfiles has updated: $(date), exit codes:$exitcode1:$exitcode2:$exitcode3" \
	>> $HOME/.local/share/log-files/github_dots.log

	case $summctrl in
	 0)	notify-send -u normal -t 3000 'GIT .dotfiles Full Update' 'Result: SUCCESS' -i $iconst && exit 0 ;;
	 *)	notify-send -u critical -t 3000 'GIT .dotfiles Full Update' 'Result: ERROR' -i $iconerr && exit 1 ;;
	esac
}
githubupdate
notifynownow
