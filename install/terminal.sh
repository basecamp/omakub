#!/bin/bash

# Needed for all installers
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip

# Run terminal installers
for installer in ~/.local/share/onyx/install/terminal/*.sh; do source $installer; done

# Download the Bubble Tea control-panel binary that powers the `onyx` command
source ~/.local/share/onyx/install/terminal/required/app-onyx-tui.sh
