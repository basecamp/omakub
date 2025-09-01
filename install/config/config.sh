#!/bin/bash

# Copy over Omakub configs
mkdir -p ~/.config
cp -R ~/.local/share/omakub/config/* ~/.config/

# Configure the bash shell using Omakub defaults
cp ~/.local/share/omakub/default/bashrc ~/.bashrc