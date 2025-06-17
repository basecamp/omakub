# We were using the snap version so that we could get easier updates, but it is currently broken so we download a deb directly from the rstudio website
#sudo snap install rstudio --classic

DEB_URL="https://download1.rstudio.org/electron/jammy/amd64/rstudio-2025.05.1-513-amd64.deb"
DOWNLOAD_DIR=$(mktemp -d)
trap "rm -rf $DOWNLOAD_DIR" EXIT
wget -O "$DOWNLOAD_DIR/rstudio.deb" "$DEB_URL"
sudo apt install -y "$DOWNLOAD_DIR/rstudio.deb"
