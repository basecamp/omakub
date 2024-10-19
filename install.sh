# Exit immediately if a command exits with a non-zero status
set -e

# Check the distribution name and version and abort if incompatible
source ~/.local/share/omakub/install/check-version.sh

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo "Get ready to make a few choices..."
  source ~/.local/share/omakub/install/terminal/required/app-gum.sh >/dev/null
  source ~/.local/share/omakub/install/first-run-choices.sh

  echo "Installing terminal tools..."
  # Install terminal tools
	source ~/.local/share/omakub/install/terminal.sh

  echo "Installing desktop tools and tweaks..."
  # Install desktop tools and tweaks
  source ~/.local/share/omakub/install/desktop.sh

  # Reset idle and lock settings to normal values
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300
else
  echo "Only installing terminal tools..."
	# Install terminal tools
	source ~/.local/share/omakub/install/terminal.sh
fi
