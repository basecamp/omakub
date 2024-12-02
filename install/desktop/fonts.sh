mkdir -p ~/.local/share/fonts

cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
unzip CascadiaMono.zip -d CascadiaFont
cp CascadiaFont/*.ttf ~/.local/share/fonts
rm -rf CascadiaMono.zip CascadiaFont

wget -O iafonts.zip https://github.com/iaolo/iA-Fonts/archive/refs/heads/master.zip
unzip iafonts.zip -d iaFonts
cp iaFonts/iA-Fonts-master/iA\ Writer\ Mono/Static/iAWriterMonoS-*.ttf ~/.local/share/fonts
rm -rf iafonts.zip iaFonts

curl -s https://api.github.com/repos/be5invis/Iosevka/releases/latest | rg -N "browser_download_url" | rg -N --color never "SuperTTC-Iosevka-\d+\.\d+\.\d+\.zip" | sd '"' "'" | choose 1 | xargs -I % xh -F -o iosevka.zip GET %
unzip -o iosevka.zip -d iosevka
cp iosevka/*.ttc ~/.local/share/fonts
rm -rf iosevka.zip iosevka

fc-cache
cd -
