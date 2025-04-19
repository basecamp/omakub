sudo add-apt-repository -y --remove ppa:libretro/stable
sudo apt update -y
sudo apt remove -y retroarch retroarch-assets
sudo apt autoremove -y
rm ~/.local/share/applications/Retroarch.desktop
