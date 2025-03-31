# Install dependencies
sudo apt install -y ffmpeg libsdl2-2.0-0 adb wget \
  gcc git pkg-config meson ninja-build libsdl2-dev \
  libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev \
  libswresample-dev libusb-1.0-0 libusb-1.0-0-dev

# Install latest Scrcpy straight from GitHub
cd /tmp
git clone https://github.com/Genymobile/scrcpy
cd scrcpy
./install_release.sh
cd ..
rm -rf scrcpy

cat <<EOF >~/.local/share/applications/Android.desktop
[Desktop Entry]
Version=1.0
Name=Android
Comment=Android Screen Mirroring
Exec=scrcpy -S
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/Android.png
Categories=GTK;
StartupNotify=false
EOF
