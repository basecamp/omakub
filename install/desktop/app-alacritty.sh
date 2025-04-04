# Alacritty is a GPU-powered and highly extensible terminal. See https://alacritty.org/
sudo apt install -y alacritty
mkdir -p ~/.config/alacritty
cp ~/.local/share/omakub/configs/alacritty.toml ~/.config/alacritty/alacritty.toml
cp ~/.local/share/omakub/themes/tokyo-night/alacritty.toml ~/.config/alacritty/theme.toml
cp ~/.local/share/omakub/configs/alacritty/fonts/CaskaydiaMono.toml ~/.config/alacritty/font.toml
cp ~/.local/share/omakub/configs/alacritty/font-size.toml ~/.config/alacritty/font-size.toml

# Make alacritty default terminal emulator
sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty

# Adding alacritty to nautilus contextual menu requires the python wrapper for the libraries
sudo apt install -y python3-nautilus
mkdir -p ~/.local/share/nautilus-python/extensions/

cat > ~/.local/share/nautilus-python/extensions/open-alacritty.py <<TECHNICALLYNOTACONFIGSOHEREDOCCEDITIS
import os
from urllib.parse import unquote
from gi.repository import Nautilus, GObject
from typing import List

class OpenTerminalExtension(GObject.GObject, Nautilus.MenuProvider):
    def _open_terminal(self, file: Nautilus.FileInfo) -> None:
        filename = unquote(file.get_uri()[7:])

        os.chdir(filename)
        os.system("alacritty")

    def menu_activate_cb(
        self,
        menu: Nautilus.MenuItem,
        file: Nautilus.FileInfo,
    ) -> None:
        self._open_terminal(file)

    def menu_background_activate_cb(
        self,
        menu: Nautilus.MenuItem,
        file: Nautilus.FileInfo,
    ) -> None:
        self._open_terminal(file)

    def get_file_items(
        self,
        files: List[Nautilus.FileInfo],
    ) -> List[Nautilus.MenuItem]:
        if len(files) != 1:
            return []

        file = files[0]
        if not file.is_directory() or file.get_uri_scheme() != "file":
            return []

        item = Nautilus.MenuItem(
            name="NautilusPython::openterminal_file_item",
            label="Open in Alacritty",
            tip="Open Alacritty In %s" % file.get_name(),
        )
        item.connect("activate", self.menu_activate_cb, file)

        return [
            item,
        ]

    def get_background_items(
        self,
        current_folder: Nautilus.FileInfo,
    ) -> List[Nautilus.MenuItem]:
        item = Nautilus.MenuItem(
            name="NautilusPython::openterminal_file_item2",
            label="Open in Alacritty",
            tip="Open Alacritty In %s" % current_folder.get_name(),
        )
        item.connect("activate", self.menu_background_activate_cb, current_folder)

        return [
            item,
        ]
TECHNICALLYNOTACONFIGSOHEREDOCCEDITIS
