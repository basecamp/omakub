#!/usr/bin/env bash

cd /tmp || exit
wget -O code.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo apt install -y ./code.deb
rm code.deb
cd - || exit

mkdir -p "$HOME/.config/Code/User"
cp "$HOME/.local/share/omakub/configs/vscode.json" "$HOME/.config/Code/User/settings.json"

# Install default supported themes
code --install-extension enkia.tokyo-night
