sudo dnf install -y ulauncher

mkdir -p ~/.config/autostart/
cp ~/.local/share/omakfed/configs/ulauncher.desktop ~/.config/autostart/ulauncher.desktop
gtk-launch ulauncher.desktop >/dev/null 2>&1
sleep 2
cp ~/.local/share/omakfed/configs/ulauncher.json ~/.config/ulauncher/settings.json
