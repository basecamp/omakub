#!/bin/bash

sudo rm /etc/apt/sources.list.d/1password.list
sudo rm /usr/share/keyrings/1password-archive-keyring.gpg
sudo rm /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
sudo rm -r /etc/debsig/policies/AC2D62742012EA22/
sudo apt remove --purge -y 1password 1password-cli
