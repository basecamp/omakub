#!/bin/bash

sudo apt remove --purge -y brave-browser
sudo rm /etc/apt/sources.list.d/brave-browser-release.list
sudo rm /usr/share/keyrings/brave-browser-*.gpg
