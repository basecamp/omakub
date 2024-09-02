# Exit immediately if a command exits with a non-zero status
set -e

# Desktop software and tweaks will only be installed if we're running Gnome
RUNNING_GNOME=$([[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]] && echo true || echo false)

# Check the distribution name and version and abort if incompatible
source ~/.local/share/omakub/install/check-version.sh

if $RUNNING_GNOME; then
  # Ensure computer doesn't go to sleep or lock while installing
  LOCK_ENABLED_ORIGINAL_VALUE="$(gsettings get org.gnome.desktop.screensaver lock-enabled)"
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  IDLE_DELAY_ORIGINAL_VALUE="$(gsettings get org.gnome.desktop.session idle-delay)"
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

  # Revert to original idle and lock settings
  gsettings set org.gnome.desktop.screensaver lock-enabled "${LOCK_ENABLED_ORIGINAL_VALUE}"
  gsettings set org.gnome.desktop.session idle-delay "${IDLE_DELAY_ORIGINAL_VALUE}"
fi
