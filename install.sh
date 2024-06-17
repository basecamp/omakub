# Exit immediately if a command exits with a non-zero status
set -e

# Needed for all installers
sudo apt update -y
sudo apt install -y curl git unzip

# Run installers
for script in ~/.local/share/omakub-wsl/install/*.sh; do source $script; done

# Upgrade everything that might ask for a reboot last
sudo apt upgrade -y

echo "Installation complete. Please restart the WSL terminal to apply changes."
