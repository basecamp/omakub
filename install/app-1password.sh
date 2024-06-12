#!/usr/bin/env bash

cd ~/Downloads || exit
wget https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb
sudo apt install -y ./1password-latest.deb
rm 1password-latest.deb
cd - || exit
