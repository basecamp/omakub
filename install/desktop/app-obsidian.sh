#!/bin/bash

# Obsidian is a multi-platform note taking application. See https://obsidian.md
cd /tmp
OBSIDIAN_VERSION=$(curl -s https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | grep tag_name | cut -d '"' -f 4)
wget -O obsidian.deb "https://github.com/obsidianmd/obsidian-releases/releases/download/${OBSIDIAN_VERSION}/obsidian_${OBSIDIAN_VERSION}_amd64.deb"
sudo apt install -y ./obsidian.deb
rm obsidian.deb
cd -
