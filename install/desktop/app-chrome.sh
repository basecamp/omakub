# Browse the web with the most popular browser. See https://www.google.com/chrome/
cd /tmp
if [[ -z $UTILS_SOURCED ]]; then
    source ~/.local/share/omakub/utils.sh
fi
ARCH=$(get_arch "chrome")
if wget "https://dl.google.com/linux/direct/google-chrome-stable_current_$ARCH.deb"; then
    sudo apt install -y "./google-chrome-stable_current_$ARCH.deb"
    rm "google-chrome-stable_current_$ARCH.deb"
    xdg-settings set default-web-browser google-chrome.desktop
    cd -
else
    cd -
    false
fi

