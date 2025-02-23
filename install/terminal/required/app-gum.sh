# Gum is used for the Omakub commands for tailoring Omakub after the initial install
cd /tmp
GUM_VERSION="0.14.3" # Use known good version
wget -qO gum.tar.gz "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_Linux_x86_64.tar.gz"
tar -xzvf gum.tar.gz
sudo cp gum_0.14.3_Linux_x86_64/gum /usr/bin
rm gum.tar.gz
cd -
