cat <<EOF >~/.local/share/applications/omakfed.desktop
[Desktop Entry]
Version=1.0
Name=omakfed
Comment=omakfed Controls
Exec=alacritty --config-file /home/$USER/.local/share/omakfed/defaults/alacritty/pane.toml --class=omakfed --title=omakfed -e omakfed
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakfed/applications/icons/omakfed.png
Categories=GTK;
StartupNotify=false
EOF
