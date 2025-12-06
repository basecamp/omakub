#!/bin/bash

# Needed for all installers
sudo apt update -y
sudo apt -o APT::Get::Always-Include-Phased-Updates=true dist-upgrade -y
sudo apt install -y curl git unzip

# Run terminal installers
for installer in ~/.local/share/omakub/install/terminal/*.sh; do source $installer; done
