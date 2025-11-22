#!/bin/bash

# Gum is used for the Omakub commands for tailoring Omakub after the initial install

if [ ! -f /etc/apt/sources.list.d/charm.list ]; then
    [ -f /etc/apt/keyrings/charm.gpg ] && sudo rm /etc/apt/keyrings/charm.gpg
    curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
    echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
fi
sudo apt-get update
sudo apt-get install -y gum
