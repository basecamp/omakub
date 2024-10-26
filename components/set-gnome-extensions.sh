sudo apt install -y gnome-shell-extension-manager pipx
pipx install gnome-extensions-cli --system-site-packages --force
pipx ensurepath
source ~/.bashrc

# Turn off default Ubuntu extensions
gnome-extensions disable tiling-assistant@ubuntu.com
gnome-extensions disable ding@rastersoft.com
gnome-extensions disable ubuntu-dock@ubuntu.com

# Pause to assure user is ready to accept confirmations
gum confirm "To install Gnome extensions, you need to accept some confirmations. Are you ready?"

# Install new extensions
gext install tactile@lundal.io
gext install AlphabeticalAppGrid@stuarthayhurst

# Compile gsettings schemas in order to be able to set them
sudo cp ~/.local/share/gnome-shell/extensions/tactile@lundal.io/schemas/org.gnome.shell.extensions.tactile.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/AlphabeticalAppGrid\@stuarthayhurst/schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Configure Tactile
gsettings set org.gnome.shell.extensions.tactile col-0 2
gsettings set org.gnome.shell.extensions.tactile col-1 1
gsettings set org.gnome.shell.extensions.tactile col-2 1
gsettings set org.gnome.shell.extensions.tactile col-3 0
gsettings set org.gnome.shell.extensions.tactile row-0 1
gsettings set org.gnome.shell.extensions.tactile row-1 1
gsettings set org.gnome.shell.extensions.tactile gap-size 10

# Configure AlphabeticalAppGrid
gsettings set org.gnome.shell.extensions.alphabetical-app-grid folder-order-position 'end'