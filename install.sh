# Exit immediately if a command exits with a non-zero status
set -e

# Desktop software and tweaks will only be installed if we're running Gnome
RUNNING_GNOME=$([[ "${XDG_CURRENT_DESKTOP##*:}" =~ [Gg][Nn][Oo][Mm][Ee] ]] && echo true || echo false)

# Check the distribution name and version and abort if incompatible
source ~/.local/share/omakub/install/check-version.sh

#source the util functions
source ~/.local/share/omakub/utils.sh

if $RUNNING_GNOME; then
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

  # Revert to normal idle and lock settings
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300
fi

print_omakub_report | tee ~/.local/share/omakub/omakub_report.log
