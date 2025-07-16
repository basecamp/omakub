#!/bin/bash

# Install asdcontrol
git clone https://github.com/nikosdion/asdcontrol.git /tmp/asdcontrol
cd /tmp/asdcontrol
make
sudo make install
cd -
rm -rf /tmp/asdcontrol

# Setup sudo-less controls
echo 'KERNEL=="hiddev*", ATTRS{idVendor}=="05ac", ATTRS{idProduct}=="9243", GROUP="users", OWNER="root", MODE="0660"' | sudo tee /etc/udev/rules.d/50-apple-xdr.rules >/dev/null
echo 'KERNEL=="hiddev*", ATTRS{idVendor}=="05ac", ATTRS{idProduct}=="1114", GROUP="users", OWNER="root", MODE="0660"' | sudo tee /etc/udev/rules.d/50-apple-studio.rules >/dev/null
sudo udevadm control --reload-rules

# Reboot to pickup changes
gum confirm "Ready to reboot for brightness controls to be available?" && sudo reboot
