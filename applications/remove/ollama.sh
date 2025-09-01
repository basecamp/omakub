#!/bin/bash

# Remove service
sudo systemctl stop ollama
sudo systemctl disable ollama
sudo rm /etc/systemd/system/ollama.service

# Remove command
sudo rm $(which ollama)

# Remove installed models
sudo rm -r /usr/share/ollama
sudo userdel ollama
sudo groupdel ollama
