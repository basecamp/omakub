#!/bin/bash

echo "Move .bashrc to use Omakub defaults"

mv ~/.bashrc ~/.bashrc.bak
mv ~/.inputrc ~/.inputrc.bak
cp ~/.local/share/omakub/defaults/bashrc ~/.bashrc
