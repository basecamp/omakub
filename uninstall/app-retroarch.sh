sudo add-apt-repository --remove ppa:libretro/stable
sudo apt update -y
sudo apt remove -y retroarch
sudo apt autoremove -y
rm ~/.local/share/applications/Retroarch.desktop
