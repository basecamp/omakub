# check if zed is installed
if command -v zed &>/dev/null; then
    ZED_SETTINGS_PATH="$HOME/.config/zed/settings.json"
    # strip c/c++ like comments from settings.json and install theme and set it
    cpp -P -E $ZED_SETTINGS_PATH | jq ".auto_install_extensions[\"$ZED_EXTENSION\"] = true | .theme = \"$ZED_THEME\"" > temp.json && mv temp.json $ZED_SETTINGS_PATH
fi