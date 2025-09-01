#!/bin/bash

# Install Fastfetch
sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
sudo apt update -y
sudo apt install -y fastfetch

# Install mise for managing multiple versions of languages. See https://mise.jdx.dev/
sudo apt update -y && sudo apt install -y gpg wget curl
sudo install -dm 755 /etc/apt/keyrings
wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/apt/keyrings/mise-archive-keyring.gpg 1>/dev/null
echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=$(dpkg --print-architecture)] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
sudo apt update
sudo apt install -y mise

# Install Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Install Docker
source ~/.local/share/omakub/applications/install/docker.sh

# Install GitHub CLI
source ~/.local/share/omakub/applications/install/github-cli.sh