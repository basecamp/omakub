#!/bin/bash

cat <<EOF >~/.local/share/applications/Omakub.desktop
[Desktop Entry]
Version=1.0
Name=Omakub
Comment=Omakub Controls
Exec=alacritty --config-file $HOME/.config/alacritty/pane.toml --class=Omakub --title=Omakub -e omakub
Terminal=false
Type=Application
Icon=$HOME/.local/share/omakub/applications/icons/Omakub.png
Categories=GTK;
StartupNotify=false
EOF
