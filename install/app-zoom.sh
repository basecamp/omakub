cd ~/Downloads
if [[ $ARCH == "amd64" ]]; then
    wget https://zoom.us/client/latest/zoom_amd64.deb
    sudo apt install -y ./zoom_amd64.deb
    rm zoom_amd64.deb
elif [[ $ARCH == "arm64" ]]; then
cat <<EOF > ~/.local/share/applications/Zoom.desktop
[Desktop Entry]
Version=1.0
Name=Zoom
Comment=Zoom online meetings
Exec=xdg-open --app="https://zoom.us/meeting" --name=Zoom
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/web-apps/icons/Zoom.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF
fi
cd -