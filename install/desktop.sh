# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

#source the utils if not sourced already
if [[ -z $UTILS_SOURCED ]]; then
    source ~/.local/share/omakub/utils.sh
fi

# Run desktop installers
for installer in ~/.local/share/omakub/install/desktop/*.sh; do 
    trap "handle_omakub_source_error $installer" ERR
    source "$installer" && handle_omakub_source_success "$installer"
    trap - ERR
done

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
