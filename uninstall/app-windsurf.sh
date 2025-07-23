#!/bin/bash

sudo apt purge -y windsurf
sudo rm /etc/apt/sources.list.d/windsurf.list
sudo rm /usr/share/keyrings/windsurf-stable-archive-keyring.gpg
