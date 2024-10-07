# Exit immediately if a command exits with a non-zero status
set -e

# Desktop software and tweaks will only be installed if we're running Gnome
RUNNING_GNOME=$([[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]] && echo true || echo false)

# Check the distribution name and version and abort if incompatible
source ~/.local/share/omakub/install/check-version.sh

if $RUNNING_GNOME; then
  # Try to respect any previously configured settings
  previous_screensaver_lock=$(gsettings get org.gnome.desktop.screensaver lock-enabled) || true
  previous_idle_delay=$(gsettings get org.gnome.desktop.session idle-delay | cut -d\  -f2) || true

  # Ensure computer doesn't go to sleep or lock while installing
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo "Get ready to make a few choices..."
  source ~/.local/share/omakub/install/terminal/required/app-gum.sh >/dev/null
  source ~/.local/share/omakub/install/first-run-choices.sh

  echo "Installing terminal and desktop tools.."
else
  echo "Only installing terminal tools..."
fi

# Install terminal tools
source ~/.local/share/omakub/install/terminal.sh

if $RUNNING_GNOME; then
  # Install desktop tools and tweaks
  source ~/.local/share/omakub/install/desktop.sh

  # Restore idle and lock settings
  gsettings set org.gnome.desktop.screensaver lock-enabled ${previous_screensaver_lock:-true}
  gsettings set org.gnome.desktop.session idle-delay ${previous_idle_delay:-300}
fi
