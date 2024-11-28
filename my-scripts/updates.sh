#!/usr/bin/env bash
echo "Checking for updates..."
sudo apt update -q > /dev/null 2>&1
UPDATES=$(apt list --upgradable 2>/dev/null | tail -n +2 | wc -l)
apt list --upgradeable
read -n 1 -r -p "$UPDATES Updates are available, update now? [y/N] " response
response=${response,,}  #tolower
if [[ "$response" =~ ^(yes|y)$ ]]; then
    sudo apt upgrade -y;
else
    exit 1
fi
echo "Updates complete. Press Enter to close this window."
read ans
