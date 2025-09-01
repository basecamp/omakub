#!/bin/bash

# ==============================================================================
# PLYMOUTH SETUP
# ==============================================================================

# Ubuntu uses initramfs-tools, not mkinitcpio
# Check if plymouth is already in initramfs modules
if ! grep -q "plymouth" /etc/initramfs-tools/modules 2>/dev/null; then
  echo "plymouth" | sudo tee -a /etc/initramfs-tools/modules
  # Update initramfs
  sudo update-initramfs -u
fi

# Install and configure Omakub Plymouth theme
THEME_SOURCE_DIR="$(dirname "$(dirname "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)")")/default/plymouth"

if [ -d "$THEME_SOURCE_DIR" ]; then
  sudo mkdir -p /usr/share/plymouth/themes/omakub/
  sudo cp -r "$THEME_SOURCE_DIR"/* /usr/share/plymouth/themes/omakub/

  # Check if the theme is already set
  current_theme=$(readlink /etc/alternatives/default.plymouth 2>/dev/null)
  if [[ "$current_theme" != *"omakub"* ]]; then
    # Install the theme as an alternative
    sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/omakub/omakub.plymouth 100

    # Set it as the default
    sudo update-alternatives --set default.plymouth /usr/share/plymouth/themes/omakub/omakub.plymouth
  fi
fi

if [ ! -f /etc/systemd/system/plymouth-quit.service.d/wait-for-graphical.conf ]; then
  # Make plymouth remain until graphical.target
  sudo mkdir -p /etc/systemd/system/plymouth-quit.service.d
  sudo tee /etc/systemd/system/plymouth-quit.service.d/wait-for-graphical.conf <<'EOF'
[Unit]
After=multi-user.target
EOF
fi

# Mask plymouth-quit-wait.service only if not already masked
if ! systemctl is-enabled plymouth-quit-wait.service | grep -q masked; then
  sudo systemctl mask plymouth-quit-wait.service
  sudo systemctl daemon-reload
fi

# Final initramfs update to ensure all Plymouth changes are applied
sudo update-initramfs -u