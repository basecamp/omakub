#!/bin/bash

# Allow nothing in, everything out
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow ports for LocalSend
sudo ufw allow 53317/udp
sudo ufw allow 53317/tcp

# Allow SSH in
sudo ufw allow 22/tcp

# Allow Docker containers to use DNS on host
sudo ufw allow in on docker0 to any port 53

# Turn on the firewall
sudo ufw enable

# Install ufw-docker script to manage Docker firewall rules
sudo wget -O /usr/local/bin/ufw-docker https://github.com/chaifeng/ufw-docker/raw/master/ufw-docker
sudo chmod +x /usr/local/bin/ufw-docker

# Turn on Docker protections
sudo ufw-docker install
sudo ufw reload
