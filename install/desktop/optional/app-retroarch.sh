sudo add-apt-repository -y ppa:libretro/stable
sudo apt update -y
sudo apt install -y retroarch

cat <<EOF >~/.local/share/applications/Retroarch.desktop
[Desktop Entry]
Name=RetroArch
Exec=/usr/bin/retroarch
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/Retroarch.png
Comment=Play retro games
Categories=Game;Emulator;
Terminal=false
EOF
