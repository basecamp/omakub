FONT_SIZE_PATH="$HOME/.config/alacritty/font-size.toml"
choice=$(sed -n "s/^size = \(.*\)$/\1/p" $FONT_SIZE_PATH)

# loop while various font sizes are selected; focus on current font size
while [[ $choice =~ ^[0-9]+$ ]]; do
  sed -i "s/^size = .*$/size = $choice/g" $FONT_SIZE_PATH
  choice=$(gum choose --selected "$choice" {7..14} "<< Back" --height 11 --header "Choose your terminal font size")
done

source $OMAKUB_PATH/bin/omakub-sub/font.sh
