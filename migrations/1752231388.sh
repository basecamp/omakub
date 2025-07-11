# Remove ulauncher
sudo apt remove --purge -y ulauncher
rm -rf ~/.config/ulauncher
rm -rf ~/.local/share/ulauncher

# Install wofi
sudo apt install -y wofi

# Use custom wofi config
mkdir -p ~/.config/wofi
cp ~/.local/share/omakub/configs/wofi/config ~/.config/wofi/config

# Use the user's wofi theme
echo -e "\033[1;35mIn order to use the wofi theme, you need to select it.\033[0m"
THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Everforest" "Gruvbox" "Kanagawa" "Rose Pine")
THEME=$(gum choose "${THEME_NAMES[@]}" ">> Skip" --header "Choose your current theme" --height 10 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != ">>-skip" ]; then
  if [ -f "$OMAKUB_PATH/themes/$THEME/wofi.css" ]; then
    cp $OMAKUB_PATH/themes/$THEME/wofi.css ~/.config/wofi/wofi.css
  fi
fi

# Set wofi as the launcher
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "@as []"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Wofi'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'wofi-launcher'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>space'

# Autoremove unused packages
sudo apt autoremove -y