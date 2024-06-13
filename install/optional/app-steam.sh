cd /tmp
wget https://cdn.akamai.steamstatic.com/client/installer/steam.deb
sudo apt install -y ./steam.deb
sudo apt-get install --no-remove -oAPT::Get::AutomaticRemove=false libc6:amd64 libc6:i386 libegl1:amd64 libegl1:i386 libgbm1:amd64 libgbm1:i386 libgl1-mesa-dri:amd64 libgl1-mesa-dri:i386 libgl1:amd64 libgl1:i386 steam-libs-amd64:amd64
rm steam.deb
cd -

# Add steam to dock
new_app="steam.desktop"

current_favorites=$(gsettings get org.gnome.shell favorite-apps)
# Check if the new app is already in the list
if [[ "$current_favorites" == *"$new_app"* ]]; then
    echo "App already exists in favorites."
    exit 0
fi

# Remove the closing bracket from the current favorites list
current_favorites_trimmed=$(echo $current_favorites | sed "s/]//")

new_favorites_list="${current_favorites_trimmed}, '${new_app}']"
gsettings set org.gnome.shell favorite-apps "$new_favorites_list"
