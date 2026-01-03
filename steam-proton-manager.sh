#!/bin/bash

WINE="$1/pfx"
STEAM=$1
input=$2
app=$3

function usage(){
	echo
	echo "USAGE: $0 {"STEAM_COMPAT_DATA_PATH"} {"shortcut"} optional: {"app"}"
	echo
	echo "Example: $0 /home/$USER/.local/share/Steam/steamapps/compatdata/<appid> c"
	echo
	echo "Hint: Always use absolute paths! The 2nd parameter is optional."
	echo
	echo "The 2nd paramater can be used as shortcut:"
	echo "run      = start application within prefix"
	echo "control  = start Control Panel"
	echo "regedit  = start Regisitry Editor"
	echo "taskmgr  = start Task Manager"
	echo "winecfg  = start WINE-Configuration"
	echo "tricks   = start winetricks"
	echo "fonts    = Install core (f)onts"
	echo "vcrun    = Install Visual (C)++ Runtime 2015-2022"
	echo "dotnet   = Install .(N)ET 4.8"
	echo
}

if [ ! -d "${WINE}" ] && [ ! -d "${STEAM}" ]; then
	usage
	echo "No Paramaters found or folder(s) do not exist. Exiting..."
	exit
else
	if [ $(pgrep "wineserver" | wc -l ) -gt 0 ]; then
		echo "+ wineserver is running, trying to kill it"
		$(pkill -9 wineserver)
		sleep 5
	fi
	if [ -z "${input}" ]; then
		echo
		echo "CHECK IF SHOWN PATHS ARE CORRECT:"
		echo
		echo "WINEPREFIX=${WINE}"
		echo "STEAM_COMPAT_DATA_PATH=${STEAM}"
		echo
		echo "What do you want to run?"
		echo "{ (run) wine | (c)ontrol | (r)egedit | (t)askmgr | (w)inecfg | w(i)netricks }"
		echo
		echo "For winetricks:"
		echo "(i)  Just launch winetricks GUI"
		echo "(if) Install core (f)onts"
		echo "(ic) Install Visual (C)++ Runtime 2015-2022"
		echo "(in) Install .(N)ET 4.8"
		echo
		read -p "#> " input
	fi
	case $input in
		(run | wine)
			$(WINEPREFIX=${WINE} STEAM_COMPAT_DATA_PATH=${STEAM} wine ${app})
			;;
		(c | control)
			$(WINEPREFIX=${WINE} STEAM_COMPAT_DATA_PATH=${STEAM} wine control)
			;;
		(r | regedit)
			$(WINEPREFIX=${WINE} STEAM_COMPAT_DATA_PATH=${STEAM} wine regedit)
			;;
		(t | taskmgr)
			$(WINEPREFIX=${WINE} STEAM_COMPAT_DATA_PATH=${STEAM} wine taskmgr)
			;;
		(w | winecfg)
			$(WINEPREFIX=${WINE} STEAM_COMPAT_DATA_PATH=${STEAM} winecfg)
			;;
		(i | tricks)
			$(WINEPREFIX=${WINE} winetricks prefix=${STEAM})
			;;
		(if | fonts)
			$(WINEPREFIX=${WINE} winetricks prefix=${STEAM} -q -v corefonts)
			;;
		(ic | vcrun)
			$(WINEPREFIX=${WINE} winetricks prefix=${STEAM} -q -v vcrun2022)
			;;
		(in | dotnet)
			$(WINEPREFIX=${WINE} winetricks prefix=${STEAM} -q -v dotnet48)
			;;
		*)

	esac
fi
unset WINE STEAM input
