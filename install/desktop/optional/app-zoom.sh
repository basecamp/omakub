# Make video calls using https://zoom.us/
cd /tmp
if [[ -z $UTILS_SOURCED ]]; then
    source ~/.local/share/omakub/utils.sh
fi
ARCH=$(get_arch "zoom")
if wget "https://zoom.us/client/latest/zoom_${ARCH}.deb"; then
  sudo apt install -y "./zoom_${ARCH}.deb"
  rm "zoom_${ARCH}.deb"
  cd -
else
  cd -
  false
fi
