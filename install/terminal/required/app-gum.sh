# Gum is used for the Omakub commands for tailoring Omakub after the initial install
cd /tmp
if [[ -z $UTILS_SOURCED ]]; then
    source ~/.local/share/omakub/utils.sh
fi
ARCH=$(get_arch "gum")
GUM_VERSION="0.14.3" # Use known good version
wget -qO gum.deb "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_${ARCH}.deb"
sudo apt-get install -y ./gum.deb
rm gum.deb
cd -
