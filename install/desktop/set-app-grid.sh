# App doesn't do anything when started from the app grid
if [ -f "/var/lib/flatpak/exports/share/applications/org.flameshot.Flameshot.desktop" ]; then
  sudo rm -rf /var/lib/flatpak/exports/share/applications/org.flameshot.Flameshot.desktop
fi
