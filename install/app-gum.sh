# Gum is used for the Omakub commands for tailoring Omakub after the initial install
cd ~/Downloads
GUM_VERSION="0.14.1" # Use known good version
curl -sLo gum.deb "https://github.com/charmbracelet/gum/releases/latest/download/gum_${GUM_VERSION}_${ARCH}.deb"
sudo apt install -y ./gum.deb
rm gum.deb
cd -