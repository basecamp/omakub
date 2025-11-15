#!/bin/bash

. /etc/os-release

if [ "$ID" == "ubuntu" ]; then
  sudo add-apt-repository universe -y
  sudo add-apt-repository -y ppa:cappelikan/ppa
fi
sudo apt update
sudo apt install -y mainline
