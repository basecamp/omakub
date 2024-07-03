cat <<EOF >~/.local/share/applications/Omakub.desktop
[Desktop Entry]
Version=1.0
Name=Omakub
Comment=Omakub Controls
Exec=alacritty --config-file /home/$USER/.local/share/omakub/defaults/alacritty/pane.toml -e omakub
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/Omakub.png
Categories=GTK;
StartupNotify=false
EOF
