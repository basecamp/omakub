# Play games from https://store.steampowered.com/
cd /tmp

sudo dpkg --add-architecture i386
sudo apt install libgl1-mesa-dri:i386
sudo apt install libgl1:i386

wget https://cdn.akamai.steamstatic.com/client/installer/steam.deb
sudo apt install -y ./steam.deb
rm steam.deb
cd -
