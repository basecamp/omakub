#!/bin/bash

source "${OMAKUB_PATH:-$HOME/.local/share/omakub}/install/lib/compat.sh"

# jq parses the download URL out of Cursor's API and is not installed by default
sudo apt install -y jq fuse3
apt_install_first libfuse2t64 libfuse2

cd /tmp
curl -L "https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=stable" | jq -r '.downloadUrl' | xargs curl -L -o cursor.appimage
sudo mv cursor.appimage /opt/cursor.appimage
sudo chmod +x /opt/cursor.appimage

DESKTOP_FILE="/usr/share/applications/cursor.desktop"

sudo bash -c "cat > $DESKTOP_FILE" <<EOL
[Desktop Entry]
Name=Cursor
Comment=AI-powered code editor
Exec=/opt/cursor.appimage --no-sandbox
Icon=/home/$USER/.local/share/omakub/applications/icons/cursor.png
Type=Application
Categories=Development;IDE;
EOL

if [ -f "$DESKTOP_FILE" ]; then
	echo "cursor.desktop created successfully"
else
	echo "Failed to create cursor.desktop"
fi
