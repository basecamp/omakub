#!/bin/bash

if [ ! -f /etc/apt/sources.list.d/windsurf.list ]; then
    [ -f /usr/share/keyrings/windsurf-stable-archive-keyring.gpg ] && sudo rm /usr/share/keyrings/windsurf-stable-archive-keyring.gpg
    curl -fsSL "https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/windsurf.gpg" | sudo gpg --dearmor -o /usr/share/keyrings/windsurf-stable-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/windsurf-stable-archive-keyring.gpg arch=amd64] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list >/dev/null
fi

sudo apt update
sudo apt install -y windsurf
