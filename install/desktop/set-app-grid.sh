# Remove Btop entry for one that runs in alacritty
sudo rm -rf /usr/share/applications/btop.desktop

# App doesn't do anything when started from the app grid
sudo rm -rf /usr/share/applications/org.flameshot.Flameshot.desktop

# Remove the ImageMagick icon
sudo rm -rf /usr/share/applications/display-im6.q16.desktop

# Replacing this with btop
sudo rm -rf /usr/share/applications/org.gnome.SystemMonitor.desktop

# We added our own meant for Alacritty
sudo rm -rf /usr/local/share/applications/nvim.desktop
sudo rm -rf /usr/local/share/applications/vim.desktop

# Create folders
gsettings set org.gnome.desktop.app-folders folder-children "['Utilities', 'Sundry', 'YaST', 'Updates', 'Xtra']"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Updates/ name 'Install & Update'
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Updates/ apps "['org.gnome.Software.desktop', 'software-properties-drivers.desktop', 'software-properties-gtk.desktop', 'update-manager.desktop', 'firmware-updater_firmware-updater.desktop', 'snap-store_snap-store.desktop']"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Xtra/ name 'Xtra'
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Xtra/ apps "['gnome-language-selector.desktop', 'org.gnome.PowerStats.desktop', 'yelp.desktop']"
