#!/bin/bash

# Use Wayland by default
sudo sed -i 's/^#WaylandEnable=false/WaylandEnable=true/' /etc/gdm3/custom.conf

# Enable GDM3 service
sudo systemctl enable gdm3

# ==============================================================================
# GDM OMAKUB LOGO SETUP
# ==============================================================================

# Get the directory where this script is located
OMAKUB_GDM_LOGO="$HOME/.local/share/omakub/default/gdm/logo.png"
OMAKUB_GDM_BACKGROUND="$HOME/.local/share/omakub/default/gdm/background.png"

# Copy Omakub logo and background to system directory
sudo mkdir -p /usr/share/pixmaps/omakub/
if [ -f "$OMAKUB_GDM_LOGO" ]; then
  sudo cp "$OMAKUB_GDM_LOGO" /usr/share/pixmaps/omakub/gdm-logo.png
fi
if [ -f "$OMAKUB_GDM_BACKGROUND" ]; then
  sudo cp "$OMAKUB_GDM_BACKGROUND" /usr/share/pixmaps/omakub/gdm-background.png
fi

# Copy Omakub GDM greeter configuration
OMAKUB_GDM_CONFIG="$HOME/.local/share/omakub/default/gdm/greeter.dconf-defaults"
if [ -f "$OMAKUB_GDM_CONFIG" ]; then
  sudo cp "$OMAKUB_GDM_CONFIG" /etc/gdm3/greeter.dconf-defaults
  echo "GDM configuration applied successfully"
else
  echo "Warning: GDM configuration file not found"
fi

# Update dconf database
sudo dconf update
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/