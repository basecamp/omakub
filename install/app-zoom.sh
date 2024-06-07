cd ~/Downloads
if [[ $ARCH == "amd64" ]]; then
    wget https://zoom.us/client/latest/zoom_amd64.deb
    sudo apt install -y ./zoom_amd64.deb
    rm zoom_amd64.deb
elif [[ $ARCH == "arm64" ]]; then
    echo "Zoom is only available for amd64 architecture."
fi
cd -