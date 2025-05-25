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
"USAGE: $0 {"WINEPREFIX"} {"STEAM_COMPAT_DATA_PATH"}"

"Example: $0 /home/$USER/.local/share/Steam/steamapps/compatdata/<appid>/pfx /home/$USER/.local/share/Steam/steamapps/compatdata/<appid>"

"Hint: Always use absolute paths!"
```
