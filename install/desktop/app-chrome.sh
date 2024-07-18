# Browse the web with the most popular browser. See https://www.google.com/chrome/
cd /tmp
source ~/.local/share/omakub/get_arch.sh
ARCH=$(get_arch "chrome")
if wget "https://dl.google.com/linux/direct/google-chrome-stable_current_$ARCH.deb"; then
    sudo apt install -y "./google-chrome-stable_current_$ARCH.deb"
    rm "google-chrome-stable_current_$ARCH.deb"
    xdg-settings set default-web-browser google-chrome.desktop
fi
cd -
