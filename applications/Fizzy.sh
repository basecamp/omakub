#!/bin/bash

cat <<EOF >~/.local/share/applications/Fizzy.desktop
[Desktop Entry]
Version=1.0
Name=Fizzy
Comment=Fizzy Issue Tracker
Exec=google-chrome --app="https://app.fizzy.do/" --name=Fizzy --class=Fizzy
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/Fizzy.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF
