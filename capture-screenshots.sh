#!/usr/bin/env bash

set -e

BASE="$HOME/WK1-PM1-Kali-Linux-Virtual-Lab/screenshots"

capture() {
    local folder="$1"
    local filename="$2"

    echo
    echo "======================================"
    echo "Capture: $filename"
    echo "======================================"
    echo "Prepare the relevant window."
    read -rp "Press ENTER when ready to capture..."

    flameshot gui --path "$BASE/$folder/$filename"
}

capture "01-virtualbox-installation" "virtualbox-manager.png"
capture "02-nat-network" "nat-network-settings.png"
capture "03-kali-vm-settings" "kali-vm-network.png"
capture "04-network-configuration" "kali-network-config.png"
capture "05-connectivity-tests" "connectivity-tests.png"
capture "06-snapshots" "kali-snapshot.png"

echo
echo "Screenshot capture session completed."
echo "Location: $BASE"
