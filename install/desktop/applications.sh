#!/bin/bash

# A fresh Ubuntu has no per-user applications directory until something writes one
mkdir -p ~/.local/share/applications

for script in ~/.local/share/omakub/applications/*.sh; do source $script; done
