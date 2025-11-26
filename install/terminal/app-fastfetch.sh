#!/bin/bash

# Display system information in the terminal
if [ ! -f /etc/apt/sources.list.d/zhangsongcui3371-fastfetch.sources ]; then
	[ -f /etc/apt/keyrings/zhangsongcui3371-fastfetch.gpg ] && sudo rm /etc/apt/keyrings/zhangsongcui3371-fastfetch.gpg
	gpg --keyserver keyserver.ubuntu.com --recv 0x7e2e5cb4d4865f21
	gpg --export 0x7e2e5cb4d4865f21 | sudo tee /usr/share/keyrings/zhangsongcui3371-fastfetch.gpg >/dev/null
	printf '%s\n' \
		"Types: deb deb-src" \
		"URIs: https://ppa.launchpadcontent.net/zhangsongcui3371/fastfetch/ubuntu" \
		"Suites: ${VERSION_CODENAME}" \
		"Components: main" \
		"Architectures: amd64" \
		"Signed-By: /etc/apt/keyrings/zhangsongcui3371-fastfetch.gpg" |
		sudo tee /etc/apt/sources.list.d/zhangsongcui3371-fastfetch.sources >/dev/null
fi

sudo apt update -y
sudo apt install -y fastfetch

# Only attempt to set configuration if fastfetch is not already set
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
	# Use Omakub fastfetch config
	mkdir -p ~/.config/fastfetch
	cp ~/.local/share/omakub/configs/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
fi
