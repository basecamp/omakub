#!/bin/bash

# Shared font-setting logic used by both the legacy bash menu (font.sh) and the
# Bubble Tea TUI. Source it to get the set_font function, or run it directly:
#
#   set-font.sh "<font_name>" "<download_url>" "<file_type>"

set_font() {
	local font_name=$1
	local url=$2
	local file_type=$3
	local file_name="${font_name/ Nerd Font/}"

	if ! $(fc-list | grep -i "$font_name" >/dev/null); then
		cd /tmp
		wget -O "$file_name.zip" "$url"
		unzip "$file_name.zip" -d "$file_name"
		cp "$file_name"/*."$file_type" ~/.local/share/fonts
		rm -rf "$file_name.zip" "$file_name"
		fc-cache
		cd -
	fi

	gsettings set org.gnome.desktop.interface monospace-font-name "$font_name 10"
	sed -i "s/\"editor.fontFamily\": \".*\"/\"editor.fontFamily\": \"$font_name\"/g" ~/.config/Code/User/settings.json
}

# When executed directly with arguments, apply the font immediately.
if [[ "${BASH_SOURCE[0]}" == "${0}" ]] && [ "$#" -gt 0 ]; then
	set_font "$@"
fi
