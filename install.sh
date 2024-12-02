# Exit immediately if a command exits with a non-zero status
set -e

# Check the distribution name and version and abort if incompatible
source ~/.local/share/omakase-blue/install/check-version.sh

# TODO: Ensure computer doesn't go to sleep or lock while installing
systemd-inhibit --what=idle:sleep --who="OmakaseBlue" --why="Long-running Script" --mode=block \
bash -c '
  # Desktop software and tweaks will only be installed if we're running Gnome
  RUNNING_SWAY=$([[ "$XDG_CURRENT_DESKTOP" == *"sway"* ]] && echo true || echo false)

  if $RUNNING_SWAY; then

    echo "Get ready to make a few choices..."
    source ~/.local/share/omakase-blue/install/terminal/required/app-gum.sh >/dev/null
    source ~/.local/share/omakase-blue/install/first-run-choices.sh

    echo "Installing terminal and desktop tools..."
  else
    echo "Only installing terminal tools..."
  fi

  # Install terminal tools
  source ~/.local/share/omakase-blue/install/terminal.sh

  if $RUNNING_SWAY; then
    # Install desktop tools and tweaks
    source ~/.local/share/omakase-blue/install/desktop.sh
  fi
'
