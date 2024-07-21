if [[ -z $UTILS_SOURCED ]]; then
    source ~/.local/share/omakub/utils.sh
fi
ARCH=$(get_arch "signal")
wget -qO- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor >signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg >/dev/null
echo "deb [arch=${ARCH} signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main" |
	sudo tee /etc/apt/sources.list.d/signal-xenial.list
rm signal-desktop-keyring.gpg
sudo apt update
sudo apt install -y signal-desktop
