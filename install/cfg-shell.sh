[ -f "~/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/omakub/configs/bashrc ~/.bashrc
source ~/.local/share/omakub/defaults/bash/shell

[ -f "~/.inputrc" ] && mv ~/.inputrc ~/.inputrc.bak
cp ~/.local/share/omakub/configs/inputrc ~/.inputrc
