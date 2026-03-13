#!/bin/bash

# qBittorrent is a free and open-source BitTorrent client. See https://www.qbittorrent.org/
sudo add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
sudo apt update
sudo apt install -y qbittorrent

# Set up default theme (tokyo-night)
mkdir -p ~/.config/qBittorrent/themes
cp ~/.local/share/omakub/themes/tokyo-night/qbittorrent.qbtheme ~/.config/qBittorrent/themes/theme.qbtheme

# Pre-configure qBittorrent to use custom theme
if [ ! -f ~/.config/qBittorrent/qBittorrent.conf ]; then
  cat > ~/.config/qBittorrent/qBittorrent.conf << 'EOF'
[LegalNotice]
Accepted=true

[Preferences]
General\CustomUIThemePath=/home/$USER/.config/qBittorrent/themes/theme.qbtheme
General\UseCustomUITheme=true
EOF
  sed -i "s|\$USER|$USER|g" ~/.config/qBittorrent/qBittorrent.conf
fi
