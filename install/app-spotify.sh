curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
if [[ $ARCH == "amd64" ]]; then
  echo "deb [signed-by=/etc/apt/trusted.gpg.d/spotify.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt update
  sudo apt install -y spotify-client
elif [[ $ARCH == "arm64" ]]; then
  cat <<EOF > ~/.local/share/applications/Spotify.desktop
[Desktop Entry]
Version=1.0
Name=Spotify
Comment=Spotify online music player
Exec=xdg-open --app=https://open.spotify.com/ --name=Spotify
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/web-apps/icons/Spotify.png
Categories=GTK,Network,Music;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF
fi