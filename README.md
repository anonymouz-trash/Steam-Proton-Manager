# Steam-Proton-Manager

## Why?

I know that programs like `protontricks` exists and they're very useful, but there is no easy way to run tools like `winecfg` inside of a proton prefix, especially when `protontricks` doesn't find the corresponding AppId for like Non-Steam games. So I created this little bash script.

## Dependencies

Tools used in this script:
* wine (ofc)
* proton
* steam
* pgrep
* pkill

## Disclaimer

I'm not responsible for any damage. If unsure, make a backup before running this script.
This tool runs perfect on Arch Linux.

## Usage
```
USAGE: $0 {"STEAM_COMPAT_DATA_PATH"} {"shortcut"}

Example: $0 /home/$USER/.local/share/Steam/steamapps/compatdata/<appid> c

Hint: Always use absolute paths! The 2nd parameter is optional.

The 2nd paramater can be used as shortcut:
control  = start Control Panel
regedit  = start Regisitry Editor
taskmgr  = start Task Manager
winecfg  = start WINE-Configuration
tricks   = start winetricks
fonts    = Install core (f)onts
vcrun    = Install Visual (C)++ Runtime 2015-2022
dotnet   = Install .(N)ET 4.8
```

## Preview
![Steam Proton Manager - Menu](https://github.com/anonymouz-trash/steam-proton-manager/blob/main/preview.png?raw=true)
