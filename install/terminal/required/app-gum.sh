cd /tmp
GUM_VERSION=$(curl -s "https://api.github.com/repos/charmbracelet/gum/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -sLo gum.deb "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_amd64.deb"
sudo dpkg -i gum.deb
rm gum.deb
cd -
