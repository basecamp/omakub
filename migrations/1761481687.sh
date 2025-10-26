#!/bin/bash

# Force upgrade to gum 0.17.0 to fix issues with older versions
cd /tmp
GUM_VERSION="0.17.0"
wget -qO gum.deb "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_amd64.deb"
sudo apt-get install -y --allow-downgrades ./gum.deb
rm gum.deb
cd -