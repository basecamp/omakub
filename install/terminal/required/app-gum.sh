# Gum is used for the omakfed commands for tailoring omakfed after the initial install
cd /tmp
GUM_VERSION="0.14.3" # Use known good version
wget -qO gum.rpm "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_x86_64.rpm"
sudo dnf install -y ./gum.rpm
rm gum.rpm
cd -
