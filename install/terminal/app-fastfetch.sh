#!/bin/bash

# Display system information in the terminal
. /etc/os-release
if [ "$ID" == "ubuntu" ]; then
  sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
fi
sudo apt update -y
sudo apt install -y fastfetch

# Only attempt to set configuration if fastfetch is not already set
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  # Use Omakub fastfetch config
  mkdir -p ~/.config/fastfetch
  cp ~/.local/share/omakub/configs/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
fi
