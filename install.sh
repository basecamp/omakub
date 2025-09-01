#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eE

show_logo() {
  clear
  echo -e "\n\e[1;36m$(cat ~/.local/share/omakub/logo.txt)\e[0m"
  echo
}

show_subtext() {
  echo "$1"
  echo
}

export PATH="$HOME/.local/share/omakub/bin:$PATH"
OMAKUB_INSTALL=~/.local/share/omakub/install


# Preparation
source $OMAKUB_INSTALL/preflight/trap-errors.sh
source $OMAKUB_INSTALL/preflight/guard.sh
source $OMAKUB_INSTALL/preflight/migrations.sh
source $OMAKUB_INSTALL/preflight/presentation.sh
source $OMAKUB_INSTALL/preflight/identification.sh

# Packaging
show_logo
show_subtext "Installing packages [1/3]"
source $OMAKUB_INSTALL/packages.sh
source $OMAKUB_INSTALL/packaging/fonts.sh
source $OMAKUB_INSTALL/packaging/nvim.sh
source $OMAKUB_INSTALL/packaging/tools.sh
source $OMAKUB_INSTALL/packaging/apps.sh
source $OMAKUB_INSTALL/packaging/webapps.sh
source $OMAKUB_INSTALL/packaging/tuis.sh

# Configuration
source $OMAKUB_INSTALL/config/config.sh
source $OMAKUB_INSTALL/config/theme.sh
source $OMAKUB_INSTALL/config/git.sh
source $OMAKUB_INSTALL/config/xcompose.sh
source $OMAKUB_INSTALL/config/defaults.sh
source $OMAKUB_INSTALL/config/alacritty.sh
source $OMAKUB_INSTALL/config/firewall.sh
source $OMAKUB_INSTALL/config/hardware/fix-fkeys.sh
source $OMAKUB_INSTALL/config/hardware/framework-text-scaling.sh
source $OMAKUB_INSTALL/config/gnome/app-grid.sh
source $OMAKUB_INSTALL/config/gnome/dock.sh
source $OMAKUB_INSTALL/config/gnome/extensions.sh
source $OMAKUB_INSTALL/config/gnome/hotkeys.sh
source $OMAKUB_INSTALL/config/gnome/settings.sh

# Login
source $OMAKUB_INSTALL/login/plymouth.sh
source $OMAKUB_INSTALL/login/gdm3.sh
source $OMAKUB_INSTALL/login/alt-bootloaders.sh

# Reboot
show_logo
show_subtext "You're done!"
# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot