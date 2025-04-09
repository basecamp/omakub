wget -qO- https://updates.signal.org/desktop/dnf/keys.asc | gpg --dearmor >signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg >/dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/dnf xenial main' |
	sudo tee /etc/dnf/sources.list.d/signal-xenial.list
rm signal-desktop-keyring.gpg
sudo dnf update
sudo dnf install -y signal-desktop
