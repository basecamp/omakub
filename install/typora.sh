sudo snap install typora
cd ~/Downloads
git clone https://github.com/dhh/ia_typora
mkdir -p ~/.local/share/fonts
cp ia_typora/fonts/iAWriterMonoS-* ~/.local/share/fonts/
fc-cache
mkdir -p ~/snap/typora/88/.config/Typora/themes/
cp ia_typora/ia_typora*.css ~/snap/typora/88/.config/Typora/themes/
cd -
