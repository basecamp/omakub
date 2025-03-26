# Set icon path based on OS
if [ "$OMAKUB_OS" = "ubuntu" ]; then
  ICON_FILE="Ubuntu.png"
elif [ "$OMAKUB_OS" = "fedora" ]; then
  ICON_FILE="Fedora.png"
fi

# Create the desktop file with dynamic icon
cat <<EOF > ~/.local/share/applications/About.desktop
[Desktop Entry]
Version=1.0
Name=About
Comment=System information from Fastfetch
Exec=alacritty --config-file /home/$USER/.local/share/omakub/defaults/alacritty/pane.toml --class=About --title=About -e bash -c 'fastfetch; read -n 1 -s'
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/$ICON_FILE
Categories=GTK;
StartupNotify=false
EOF