# Gum is used for the Omakub commands for tailoring Omakub after the initial install
cd /tmp
GUM_VERSION="0.16.0" # Use known good versiona
wget -qO gum.rpm "https://github.com/charmbracelet/gum/releases/download/v0.16.0/gum-0.16.0-1.x86_64.rpm"
sudo dnf install -y ./gum.rpm
rm gum.rpm
cd -
