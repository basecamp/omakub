#!/bin/bash

# Display system information in the terminal
#
# Load OS release information
. /etc/os-release
if [ ! -f /etc/apt/sources.list.d/zhangsongcui3371-fastfetch.sources ]; then
    sudo mkdir -p /etc/apt/keyrings
    sudo rm -f /etc/apt/keyrings/zhangsongcui3371-fastfetch.asc

    curl -fsSL \
        "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xeb65ee19d802f3eb1a13cfe47e2e5cb4d4865f21" \
        | sudo tee /etc/apt/keyrings/zhangsongcui3371-fastfetch.asc > /dev/null

    printf '%s\n' \
        "Types: deb deb-src" \
        "URIs: https://ppa.launchpadcontent.net/zhangsongcui3371/fastfetch/ubuntu" \
        "Suites: ${VERSION_CODENAME}" \
        "Components: main" \
        "Architectures: amd64" \
        "Signed-By: /etc/apt/keyrings/zhangsongcui3371-fastfetch.asc" \
        | sudo tee /etc/apt/sources.list.d/zhangsongcui3371-fastfetch.sources > /dev/null
fi

sudo apt update -y
sudo apt install -y fastfetch

# Only attempt to set configuration if fastfetch is not already set
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  # Use Omakub fastfetch config
  mkdir -p ~/.config/fastfetch
  cp ~/.local/share/omakub/configs/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
fi
