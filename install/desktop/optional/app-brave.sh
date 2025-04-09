sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-dnf-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-dnf-release.s3.brave.com/ stable main" | sudo tee /etc/dnf/sources.list.d/brave-browser-release.list
sudo dnf update -y
sudo dnf install -y brave-browser
