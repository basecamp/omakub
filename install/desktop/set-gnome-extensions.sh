sudo apt install -y gnome-shell-extension-manager pipx
pipx install gnome-extensions-cli --system-site-packages

# Turn off default Ubuntu extensions
gnome-extensions disable tiling-assistant@ubuntu.com
gnome-extensions disable ubuntu-appindicators@ubuntu.com
gnome-extensions disable ubuntu-dock@ubuntu.com
gnome-extensions disable ding@rastersoft.com

# Pause to assure user is ready to accept confirmations
gum confirm "To install Gnome extensions, you need to accept some confirmations. Are you ready?"

# Install new extensions
gext install tactile@lundal.io
gext install just-perfection-desktop@just-perfection
gext install blur-my-shell@aunetx
gext install space-bar@luchrioh
gext install undecorate@sun.wxg@gmail.com
gext install Vitals@CoreCoding.com
gext install AlphabeticalAppGrid@stuarthayhurst

# Manually install Pano (until released version is Gnome 46 compatible)
wget -O /tmp/pano.zip https://github.com/oae/gnome-shell-pano/releases/download/v23-alpha2/pano@elhan.io.zip
mkdir -p ~/.local/share/gnome-shell/extensions/
unzip /tmp/pano.zip -d ~/.local/share/gnome-shell/extensions/pano@elhan.io
rm /tmp/pano.zip
sudo apt install -y gir1.2-gda-5.0 gir1.2-gsound-1.0

# Compile gsettings schemas in order to be able to set them
sudo cp ~/.local/share/gnome-shell/extensions/tactile@lundal.io/schemas/org.gnome.shell.extensions.tactile.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/just-perfection-desktop\@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/blur-my-shell\@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/space-bar\@luchrioh/schemas/org.gnome.shell.extensions.space-bar.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/pano\@elhan.io/schemas/org.gnome.shell.extensions.pano.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/Vitals\@CoreCoding.com/schemas/org.gnome.shell.extensions.vitals.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/AlphabeticalAppGrid\@stuarthayhurst/schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Configure Tactile
gsettings set org.gnome.shell.extensions.tactile col-0 1
gsettings set org.gnome.shell.extensions.tactile col-1 2
gsettings set org.gnome.shell.extensions.tactile col-2 1
gsettings set org.gnome.shell.extensions.tactile col-3 0
gsettings set org.gnome.shell.extensions.tactile row-0 1
gsettings set org.gnome.shell.extensions.tactile row-1 1
gsettings set org.gnome.shell.extensions.tactile gap-size 32

# Configure Just Perfection
gsettings set org.gnome.shell.extensions.just-perfection animation 2
gsettings set org.gnome.shell.extensions.just-perfection dash-app-running true
gsettings set org.gnome.shell.extensions.just-perfection workspace true
gsettings set org.gnome.shell.extensions.just-perfection workspace-popup false

# Configure Blur My Shell
gsettings set org.gnome.shell.extensions.blur-my-shell.appfolder blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.lockscreen blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.screenshot blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.window-list blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.panel brightness 0.6
gsettings set org.gnome.shell.extensions.blur-my-shell.panel sigma 30
gsettings set org.gnome.shell.extensions.blur-my-shell.panel pipeline 'pipeline_default'
gsettings set org.gnome.shell.extensions.blur-my-shell.overview blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.overview pipeline 'pipeline_default'
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock brightness 0.6
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock sigma 30
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock static-blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock style-dash-to-dock 0

# Configure Space Bar
gsettings set org.gnome.shell.extensions.space-bar.behavior smart-workspace-names false
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-activate-workspace-shortcuts false
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-move-to-workspace-shortcuts true
gsettings set org.gnome.shell.extensions.space-bar.shortcuts open-menu "@as []"

# Configure Pano
gsettings set org.gnome.shell.extensions.pano play-audio-on-copy false
gsettings set org.gnome.shell.extensions.pano send-notification-on-copy false
gsettings set org.gnome.shell.extensions.pano window-position 2
gsettings set org.gnome.shell.extensions.pano history-length 30
gsettings set org.gnome.shell.extensions.pano.text-item body-bg-color 'rgb(153,193,241)'

# Configure Vitals
gsettings set org.gnome.shell.extensions.vitals hide-icons true
gsettings set org.gnome.shell.extensions.vitals hot-sensors "['__network-rx_max__']"
gsettings set org.gnome.shell.extensions.vitals icon-style 0
gsettings set org.gnome.shell.extensions.vitals network-speed-format 1

# Configure AlphabeticalAppGrid
gsettings set org.gnome.shell.extensions.alphabetical-app-grid folder-order-position 'end'
