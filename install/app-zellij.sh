#!/usr/bin/env bash

cd /tmp || exit
wget -O zellij.tar.gz "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
tar -xf zellij.tar.gz zellij
sudo install zellij /usr/local/bin
rm zellij.tar.gz zellij
cd - || exit

mkdir -p "$HOME/.config/zellij/"
[ ! -f "$HOME/.config/zellij/config.kdl" ] && cp "$HOME/.local/share/omakub/configs/zellij.kdl" "$HOME/.config/zellij/config.kdl"
[ ! -L "$HOME/.config/zellij/themes" ] && ln -s "$HOME/.local/share/omakub/themes/zellij" "$HOME/.config/zellij/themes"
