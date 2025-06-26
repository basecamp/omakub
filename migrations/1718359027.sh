# Catch 1.0.0 up to 1.1.0

sudo echo "Running upgrade migration..."

# New neovim settings
mkdir -p ~/.config/nvim/plugin/after
cp $OMAKUB_PATH/configs/neovim/transparency.lua ~/.config/nvim/plugin/after/
sed -i 's/checker = { enabled = true }/checker = { enabled = true, notify = false }/g' ~/.config/nvim/lua/config/lazy.lua
source ~/.local/share/omakub/applications/Neovim.sh

# New font size setup
cp $OMAKUB_PATH/configs/alacritty/font-size.toml ~/.config/alacritty/
cp ~/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml.bak
cp $OMAKUB_PATH/configs/alacritty.toml ~/.config/alacritty/alacritty.toml
source $OMAKUB_PATH/install/desktop/set-framework-text-scaling.sh

cp $OMAKUB_PATH/themes/tokyo-night/alacritty.toml ~/.config/alacritty/theme.toml
cp $OMAKUB_PATH/configs/alacritty/fonts/CaskaydiaMono.toml ~/.config/alacritty/font.toml

# Set new Gnome settings
source $OMAKUB_PATH/install/desktop/set-gnome-settings.sh

# Install new apps
source $OMAKUB_PATH/install/desktop/a-flatpak.sh
source $OMAKUB_PATH/install/desktop/app-gnome-sushi.sh
source $OMAKUB_PATH/install/desktop/app-localsend.sh
source $OMAKUB_PATH/install/desktop/app-obsidian.sh
source $OMAKUB_PATH/install/terminal/app-fastfetch.sh
source $OMAKUB_PATH/install/terminal/apps-terminal.sh

# Add new desktop applications icons
source $OMAKUB_PATH/applications/Omakub.sh
source $OMAKUB_PATH/applications/About.sh
source $OMAKUB_PATH/applications/Activity.sh
source $OMAKUB_PATH/applications/Docker.sh

# Update icons of apps still installed
[ -f ~/.local/share/applications/Basecamp.desktop ] && source $OMAKUB_PATH/applications/Basecamp.sh

# Set new app grid
source $OMAKUB_PATH/install/desktop/set-app-grid.sh

# Add new Gnome extensions
source $OMAKUB_PATH/install/desktop/set-gnome-extensions.sh

gum style \
	--foreground 212 --border-foreground 212 --border double \
	--align left --width 80 --margin "1 2" --padding "2 4" \
	"1. alacritty.toml config moved to .bak to include new font-size.toml" \
	"2. Alacritty theme/font has been reset. Use omakub app to set again." \
	"3. To use Pano, the new clipboard manager, enable in Gnome Extensions."

gum confirm "Set your application dock to default with new apps?" && source $OMAKUB_PATH/install/desktop/set-dock.sh
gum confirm "Ready to logout for all settings to take effect?" && gnome-session-quit --logout --no-prompt
