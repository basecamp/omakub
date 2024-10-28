curl https://zed.dev/install.sh | sh

# zed does not initialize its config directory and settings.json after installation but after first run
zed
kill `pidof zed-editor`

ZED_SETTINGS_PATH="$HOME/.config/zed/settings.json"
# strip c/c++ like comments from settings.json then set  omakub theme and font
cpp -P -E $ZED_SETTINGS_PATH | jq ".theme = \"Tokyo Night\" | .auto_install_extensions[\"tokyo-night\"] = true | .buffer_font_family = \"CaskaydiaMono Nerd Font\"" > temp.json && mv temp.json $ZED_SETTINGS_PATH

# run zed to install theme
zed
sleep 3
kill `pidof zed-editor`