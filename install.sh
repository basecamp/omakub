# Exit immediately if a command exits with a non-zero status
set -e

gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

sudo apt-get update >/dev/null
sudo apt-get install -y git curl >/dev/null

source ~/.local/share/omakub/install/terminal/required/app-gum.sh >/dev/null

echo "Installing desktop tools..."

# Install desktop tools and tweaks
source ~/.local/share/omakub/install/desktop.sh

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot