#!/bin/bash

if [ ! -f /etc/yum.repos.d/vscode.repo ]; then
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
fi

sudo dnf install -y code

mkdir -p ~/.config/Code/User
cp ~/.local/share/onyx/configs/vscode.json ~/.config/Code/User/settings.json

# Install default supported themes
NODE_NO_WARNINGS=1 code --install-extension enkia.tokyo-night
