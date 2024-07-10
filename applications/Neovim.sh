cat <<EOF >~/.local/share/applications/Neovim.desktop
[Desktop Entry]
Version=1.0
Name=Neovim
Comment=Edit text files
Exec=alacritty --config-file /home/$USER/.local/share/omakub/defaults/alacritty/pane.toml -e nvim %F
Terminal=false
Type=Application
Icon=nvim
Categories=Utilities;TextEditor;
StartupNotify=false
EOF
