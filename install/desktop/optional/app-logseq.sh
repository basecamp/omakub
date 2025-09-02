#!/bin/bash
sudo mkdir -p /opt

cd /tmp
LATEST_URL=$(curl -s https://api.github.com/repos/logseq/logseq/releases/latest \
  | grep "browser_download_url.*AppImage" \
  | cut -d '"' -f 4)
wget -O logseq.appimage "$LATEST_URL"

sudo mv logseq.appimage /opt/logseq.appimage
sudo chmod +x /opt/logseq.appimage

# install only if not already installed
dpkg -s fuse3 libfuse2 >/dev/null 2>&1 || sudo apt install -y fuse3 libfuse2

DESKTOP_FILE="/usr/share/applications/logseq.desktop"

sudo bash -c "cat > $DESKTOP_FILE" <<EOL
[Desktop Entry]
Name=Logseq
Comment=Knowledge management and note-taking app
Exec=/opt/logseq.appimage
Icon=/home/$USER/.local/share/omakub/applications/icons/logseq.png
Type=Application
Categories=Office;Education;Development;
EOL

if [ -f "$DESKTOP_FILE" ]; then
	echo "logseq.desktop created successfully"
else
	echo "Failed to create logseq.desktop"
fi