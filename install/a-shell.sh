[ -f "~/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/omakora/configs/bashrc ~/.bashrc
source ~/.local/share/omakora/defaults/bash/shell

[ -f "~/.inputrc" ] && mv ~/.inputrc ~/.inputrc.bak
cp ~/.local/share/omakora/configs/inputrc ~/.inputrc
