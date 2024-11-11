# Configure the bash shell using omakfed defaults
[ -f "~/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/omakfed/configs/bashrc ~/.bashrc
# Load the PATH for use later in the installers
source ~/.local/share/omakfed/defaults/bash/shell
[ -f "~/.inputrc" ] && mv ~/.inputrc ~/.inputrc.bak
# Configure the inputrc using omakfed defaults
cp ~/.local/share/omakfed/configs/inputrc ~/.inputrc
