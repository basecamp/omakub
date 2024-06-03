cat <<EOF > ~/.local/share/applications/Basecamp.desktop
[Desktop Entry]
Version=1.0
Name=Basecamp
Comment=Basecamp Project Management
Exec=google-chrome --app="https://launchpad.37signals.com" --name=Basecamp
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/web-apps/icons/Basecamp.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF
