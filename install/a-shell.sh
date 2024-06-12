#!/usr/bin/env bash

[ -f "$HOME/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
cp "$HOME/.local/share/omakub/configs/bashrc" ~/.bashrc
# shellcheck disable=SC1091
source "$HOME/.local/share/omakub/defaults/bash/shell"

[ -f "$HOME/.inputrc" ] && mv ~/.inputrc ~/.inputrc.bak
cp "$HOME/.local/share/omakub/configs/inputrc" "$HOME/.inputrc"
