#!/bin/bash

set -eo pipefail

report_error() {
    FAILURE="$(caller): ${BASH_COMMAND}"
    echo "Something went wrong!"
    echo "Error at ${FAILURE}"
}

trap report_error ERR


cd ~/Applications
chmod +x ~/Applications/EmuDeck.AppImage
~/Applications/EmuDeck.AppImage
