# Gum is used for the Omakub commands for tailoring Omakub after the initial install
cd ~/Downloads
GUM_VERSION="0.14.1" # Use known good version
wget -O gum.deb "https://github.com/charmbracelet/gum/releases/latest/download/gum_${GUM_VERSION}_amd64.deb"
sudo apt install -y ./gum.deb
rm gum.deb
cd -
