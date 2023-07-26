#!/bin/bash

set -eo pipefail

report_error() {
    FAILURE="$(caller): ${BASH_COMMAND}"
    echo "Something went wrong!"
    echo "Error at ${FAILURE}"
}

trap report_error ERR


mkdir -p ~/Applications
curl -L "https://github.com/EmuDeck/emudeck-electron/releases/download/v2.1.4/EmuDeck-2.1.4.AppImage" -o ~/Applications/EmuDeck.AppImage 2>&1 | stdbuf -oL tr '\r' '\n' | sed -u 's/^ *\([0-9][0-9]*\).*\( [0-9].*$\)/\1\n#Download Speed\:\2/' | zenity --progress --title "Downloading EmuDeck" --width 600 --auto-close --no-cancel 2>/dev/null
chmod +x ~/Applications/EmuDeck.AppImage
~/Applications/EmuDeck.AppImage
