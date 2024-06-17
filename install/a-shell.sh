[ -f "~/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/omakub-wsl/configs/bashrc ~/.bashrc
source ~/.local/share/omakub-wsl/defaults/bash/shell

[ -f "~/.inputrc" ] && mv ~/.inputrc ~/.inputrc.bak
cp ~/.local/share/omakub-wsl/configs/inputrc ~/.inputrc
