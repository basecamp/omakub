COMPUTER_MAKER=$(sudo dmidecode -t system | grep 'Manufacturer:' | awk '{print $2}')
SCREEN_RESOLUTION=$(xrandr | grep '*+' | awk '{print $1}')

# Framework
if [ "$COMPUTER_MAKER" == "Framework" ] && [ "$SCREEN_RESOLUTION" == "2256x1504" ]; then
  gsettings set org.gnome.desktop.interface text-scaling-factor 0.8
  gsettings set org.gnome.desktop.interface cursor-size 16
  sed -i "s/size = 9/size = 7/g" ~/.config/alacritty/font-size.toml
# Lenovo
elif [ "$COMPUTER_MAKER" == "LENOVO" ] && [ "$SCREEN_RESOLUTION" == "2240x1400" ]; then
  gsettings set org.gnome.desktop.interface text-scaling-factor 0.75
  gsettings set org.gnome.desktop.interface cursor-size 16
  sed -i "s/size = 9/size = 8.25/g" ~/.config/alacritty/font-size.toml
fi
