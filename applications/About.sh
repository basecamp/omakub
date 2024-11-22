cat <<EOF >~/.local/share/applications/About.desktop
[Desktop Entry]
Version=1.0
Name=About
Comment=System information from Fastfetch
Exec=wezterm start -- bash -c 'fastfetch; read -n 1 -s'
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakase-bluefin/applications/icons/bluefin.webp
Categories=GTK;
StartupNotify=false
EOF
