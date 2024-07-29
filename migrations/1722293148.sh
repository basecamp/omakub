echo "Running upgrade migration..."

# Reset specific key bindings for launching new Alacrity and Chrome instances.
# This functionality is now handled by the generic <Shift><Alt>NUMBER combination,
# where the NUMBER is the position of the pinned application on the dock.
gsettings reset-recursively org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/
gsettings reset-recursively org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/

# Change dock icon click action and app-hotkey bindings behavior to launch
# or focus (if minimized) or minimize (if active)
# or show previews (if minimized and there are multiple running instances of the application).
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'focus-minimize-or-previews'

# Apply generic app-hotkey bindings.
source "$OMAKUB_PATH/install/desktop/set-gnome-hotkeys.sh"
