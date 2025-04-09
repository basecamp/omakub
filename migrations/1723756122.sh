# Uninstall Vitals
if [ -n "$(gnome-extensions list | grep Vitals@CoreCoding.com)" ]; then
  gnome-extensions uninstall Vitals@CoreCoding.com
fi

# Install Tophat libraries
sudo dnf install -y gir1.2-gtop-2.0 gir1.2-clutter-1.0

# Install TopHat
gext install tophat@fflewddur.github.io

sudo cp ~/.local/share/gnome-shell/extensions/tophat@fflewddur.github.io/schemas/org.gnome.shell.extensions.tophat.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Configure TopHat
gsettings set org.gnome.shell.extensions.tophat show-icons false
gsettings set org.gnome.shell.extensions.tophat show-cpu false
gsettings set org.gnome.shell.extensions.tophat show-disk false
gsettings set org.gnome.shell.extensions.tophat show-mem false
gsettings set org.gnome.shell.extensions.tophat network-usage-unit bits

# Set TopHat metrics color to match the theme
THEME_NAMES=("Tokyo Night" "Catppuccin" "Nord" "Everforest" "Gruvbox" "Kanagawa" "Rose Pine")
THEME=$(gum choose "${THEME_NAMES[@]}" "Default" --header "Choose your theme" --height 10 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "default" ]; then
  source $OMAKUB_PATH/themes/$THEME/tophat.sh
fi

# Logout
gum confirm "Ready to logout for all settings to take effect?" && gnome-session-quit --logout --no-prompt
