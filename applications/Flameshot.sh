cat <<EOF >~/.local/share/applications/Flameshot.desktop
[Desktop Entry]
Name=Flameshot
Comment=Powerful yet simple to use screenshot software.
Keywords=flameshot;screenshot;capture;shutter;
Exec=flameshot gui
Icon=/home/$USER/.local/share/omakase-bluefin/applications/icons/flameshot.png
Terminal=false
Type=Application
Categories=Graphics;
StartupNotify=false
StartupWMClass=flameshot
Actions=Configure;Capture;Launcher;
X-DBUS-StartupType=Unique
X-DBUS-ServiceName=org.flameshot.Flameshot
X-KDE-DBUS-Restricted-Interfaces=org.kde.kwin.Screenshot,org.kde.KWin.ScreenShot2

[Desktop Action Configure]
Name=Configure
Exec=flameshot config

[Desktop Action Capture]
Name=Take screenshot
Exec=flameshot gui --delay 500

[Desktop Action Launcher]
Name=Open launcher
Exec=flameshot launcher
EOF
