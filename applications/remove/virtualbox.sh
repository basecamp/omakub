#!/bin/bash

sudo apt purge -y virtualbox virtualbox-dkms virtualbox-qt virtualbox-ext-pack
sudo apt autoremove --purge -y
rm -rf ~/.config/VirtualBox
