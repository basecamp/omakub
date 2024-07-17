# Make video calls using https://zoom.us/
cd /tmp
source ~/.local/share/omakub/get_arch.sh
ARCH=$(get_arch)
if wget "https://zoom.us/client/latest/zoom_${ARCH}.deb"; then
  sudo apt install -y "./zoom_${ARCH}.deb" || true
  rm "zoom_${ARCH}.deb"
fi
cd -
