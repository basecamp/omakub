# Be fancy
source ~/.local/share/omakub/ascii.sh

# Needed for all installers
sudo apt update -y
sudo apt install -y curl git jq unzip

# Get the current idle-delay, to restore it later
IDLE_DELAY=$(gsettings get org.gnome.desktop.session idle-delay | cut -d " " -f 2)

# Ensure computer doesn't go to sleep while installing
gsettings set org.gnome.desktop.session idle-delay 0

# Run installers
for script in ~/.local/share/omakub/install/*.sh; do source $script; done

# Revert to previous idle settings
gsettings set org.gnome.desktop.session idle-delay "$IDLE_DELAY"

# Upgrade everything that might ask for a reboot last
sudo apt upgrade -y

# Reboot to pickup changes
gum confirm "Ready to logout for all settings to take effect?" && gnome-session-quit --logout --no-prompt
