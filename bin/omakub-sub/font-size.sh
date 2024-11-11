choice=$(gum choose {7..14} "<< Back" --height 11 --header "Choose your terminal font size")

if [[ $choice =~ ^[0-9]+$ ]]; then
	sed -i "s/^size = .*$/size = $choice/g" ~/.config/alacritty/font-size.toml
	source $omakfed_PATH/bin/omakfed-sub/font-size.sh
else
	source $omakfed_PATH/bin/omakfed-sub/font.sh
fi
