#/bash/bin

# Dependencies: xkblayout-state

keylayout () {
	KEYBOARD=$(xkblayout-state print '%s')
	#KEYICON="\U0002328"
		case $KEYBOARD in
			"us")	KEYBANNER="US πΊπΈ" ;;
			"ru")	KEYBANNER="RU π·πΊ" ;;
			"ua")	KEYBANNER="UA πΊπ¦" ;;
			*)		KEYBANNER="N/A" ;;
		esac
	echo -e "$KEYBANNER"
}

keylayout
