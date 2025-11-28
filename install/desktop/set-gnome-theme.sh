#!/bin/bash

# Adding support for QT themes in the style of the main theme
sudo apt-get install -y qt6ct adwaita-qt

cd /tmp
rm -f gtk.deb icons.deb

wget -O gtk.deb http://ftp.debian.org/debian/pool/main/y/yaru-theme/yaru-theme-gtk_24.04.3-1_all.deb
dpkg-deb -x gtk.deb ./yaru-theme/

wget -O icons.deb http://ftp.debian.org/debian/pool/main/y/yaru-theme/yaru-theme-icon_24.04.3-1_all.deb
dpkg-deb -x icons.deb ./yaru-icons/

mkdir -p ~/.local/share/{themes,icons}

for theme in bark viridian; do
	cp -R ./yaru-theme/usr/share/themes/Yaru-$theme{,-dark} ~/.local/share/themes/ 2>/dev/null || true
	cp -R ./yaru-icons/usr/share/icons/Yaru-$theme{,-dark} ~/.local/share/icons/ 2>/dev/null || true
done

rm -f gtk.deb icons.deb
rm -rf yaru-theme yaru-icons
cd -

source ~/.local/share/omakub/themes/tokyo-night/gnome.sh
