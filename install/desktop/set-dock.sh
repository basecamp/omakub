# Favorite apps for dock
apps=(
	"Alacritty.desktop"
	"google-chrome.desktop"
	"firefox_firefox.desktop"
	"element-desktop.desktop"
	"webex.desktop"
	"code.desktop"
	"rstudio.desktop"
	"org.zotero.Zotero.desktop"
	"md.obsidian.Obsidian.desktop"
	"org.gnome.Nautilus.desktop"
	# Password managers. Should just skip the ones we don't have installed
	"1password.desktop"
	#"bitwarden.desktop"  # Not installed yet
	"org.keepassxc.KeePassXC.desktop"
)

# Array to hold installed favorite apps
installed_apps=()

# Directory where .desktop files are typically stored
desktop_dirs=(
	"/var/lib/snapd/desktop/applications"
	"/var/lib/flatpak/exports/share/applications"
	"/usr/share/applications"
	"/usr/local/share/applications"
	"$HOME/.local/share/applications"
)

# Check if a .desktop file exists for each app
for app in "${apps[@]}"; do
	for dir in "${desktop_dirs[@]}"; do
		if [ -f "$dir/$app" ]; then
			installed_apps+=("$app")
			break
		fi
	done
done

# Convert the array to a format suitable for gsettings
favorites_list=$(printf "'%s'," "${installed_apps[@]}")
favorites_list="[${favorites_list%,}]"

# Set the favorite apps
gsettings set org.gnome.shell favorite-apps "$favorites_list"
