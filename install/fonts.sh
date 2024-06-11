mkdir -p ~/.local/share/fonts

cd ~/Downloads
wget https://github.com/evilmartians/mono/releases/download/v1.0.0/martian-mono-1.0.0-ttf.zip
unzip martian-mono-1.0.0-ttf.zip -d MartianMono
cp MartianMono/*.ttf ~/.local/share/fonts
rm -rf martian-mono-1.0.0-ttf.zip MartianMono

fc-cache
cd -

# Set Cascadia Mono as the default
gsettings set org.gnome.desktop.interface monospace-font-name 'Martian Mono 10'
