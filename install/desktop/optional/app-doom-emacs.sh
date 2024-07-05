sudo apt update -y
sudo apt upgrade -y
sudo apt install -y emacs cmake libtool-bin
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
