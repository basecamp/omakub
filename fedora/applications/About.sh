#!/bin/bash

cat <<EOF >~/.local/share/applications/About.desktop
[Desktop Entry]
Version=1.0
Name=About
Comment=System information from Fastfetch
Exec=bash -c "fastfetch; read -n 1 -s"
Terminal=true
Type=Application
Icon=/home/$USER/.local/share/onyx/applications/icons/Fedora.png
Categories=GTK;
StartupNotify=false
EOF
