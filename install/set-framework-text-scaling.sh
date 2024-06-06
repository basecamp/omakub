COMPUTER_MAKER=$(sudo dmidecode -t system | grep 'Manufacturer:' | awk '{print $2}')
SCREEN_RESOLUTION=$(xrandr | grep '*+' | awk '{print $1}')

if [ "$COMPUTER_MAKER" == "Framework" ] && [ "$SCREEN_RESOLUTION" == "2256x1504" ]; then
	gsettings set org.gnome.desktop.interface text-scaling-factor 0.8
	gsettings set org.gnome.desktop.interface cursor-size 16
fi
