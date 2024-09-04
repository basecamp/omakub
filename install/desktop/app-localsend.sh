cd /tmp
LOCALSEND_VERSION=$(curl -s "https://api.github.com/repos/localsend/localsend/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
TARGET_ARCH=$(["$(dpkg --print-architecture)" = "arm64"] && echo "arm-64" || echo "x86-64")
wget -O localsend.deb "https://github.com/localsend/localsend/releases/latest/download/LocalSend-${LOCALSEND_VERSION}-linux-${TARGET_ARCH}.deb"
sudo apt install -y ./localsend.deb
rm localsend.deb
cd -
