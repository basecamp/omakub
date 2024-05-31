echo -e "\e[32mINSTALLING OMAKUB\e[0m"

# Needed for all installers
sudo apt update -y
sudo apt install -y curl git

# Ensure computer doesn't go to sleep while installing
gsettings set org.gnome.desktop.session idle-delay 0

# Run installers
for script in ~/.local/share/omakub/install/*.sh; do source $script; done

# Revert to normal idle settings
gsettings set org.gnome.desktop.session idle-delay 300

# Reboot to pickup changes
read -p "Ready to reboot the system for all settings to take effect? [Y/n]: " response
if [[ -z "$response" || "$response" =~ ^[Yy]$ ]]; then
	sudo reboot
fi
