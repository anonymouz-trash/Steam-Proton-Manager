#!/bin/bash

WINE=$1
STEAM=$2

function usage(){
	echo
	echo "USAGE: $0 {"WINEPREFIX"} {"STEAM_COMPAT_DATA_PATH"}"
	echo
	echo "Example: $0 /home/$USER/.local/share/Steam/steamapps/compatdata/<appid>/pfx /home/$USER/.local/share/Steam/steamapps/compatdata/<appid>"
	echo
	echo "Hint: Always use absolute paths!"
	echo
}

if [ ! -d "${WINE}" ] && [ ! -d "${STEAM}" ]; then
	usage
	read -p "No Paramaters found or folder(s) do not exist. Press any key to exit."
	exit
else
	if [ $(pgrep "wineserver" | wc -l ) -gt 0 ]; then
		echo "+ wineserver is running, trying to kill it"
		$(pkill -9 wineserver)
		sleep 5
	fi
	clear
	echo "WINEPREFIX=${WINE}"
	echo "STEAM_COMPAT_DATA_PATH=${STEAM}"
	echo
	echo "What do you want to run?"
	echo "{ (c)ontrol | (r)egedit | (t)askmgr | (w)inecfg }"
	echo
	read -p "#> " input
	case $input in
		c)
			$(WINEPREFIX=${WINE} STEAM_COMPAT_DATA_PATH=${STEAM} wine control)
			;;
		r)
			$(WINEPREFIX=${WINE} STEAM_COMPAT_DATA_PATH=${STEAM} wine regedit)
			;;
		t)
			$(WINEPREFIX=${WINE} STEAM_COMPAT_DATA_PATH=${STEAM} wine taskmgr)
			;;
		w)
			$(WINEPREFIX=${WINE} STEAM_COMPAT_DATA_PATH=${STEAM} winecfg)
			;;
		*)

	esac
fi
unset WINE STEAM
