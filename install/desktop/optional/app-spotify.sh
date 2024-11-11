# Stream music using https://spotify.com

# Install Flatpak if not already installed
sudo dnf install -y flatpak

# Add Flathub repository if not already added
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Spotify via Flatpak
sudo flatpak install -y flathub com.spotify.Client
