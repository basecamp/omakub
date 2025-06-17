# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "BTR Omakub installation failed! You can retry by running: source $BTR_OMAKUB_ROOT/install.sh"' ERR

# Check the distribution name and version and abort if incompatible
source "$BTR_OMAKUB_ROOT/install/check-version.sh"

# Ask for app choices
echo "Get ready to make a few choices..."
source "$BTR_OMAKUB_ROOT/install/terminal/required/app-gum.sh" >/dev/null
source "$BTR_OMAKUB_ROOT/install/first-run-choices.sh"
source "$BTR_OMAKUB_ROOT/install/identification.sh"

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo "Installing terminal and desktop tools..."

  # Install terminal tools
  source "$BTR_OMAKUB_ROOT/install/terminal.sh"

  # Install desktop tools and tweaks
  source "$BTR_OMAKUB_ROOT/install/desktop.sh"

  # Revert to normal_ROOT idle and lock settings
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300
else
  echo "Only installing terminal tools..."
  source "$BTR_OMAKUB_ROOT/install/terminal.sh"
fi
