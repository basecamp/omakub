if [ $(xrandr | grep '*+' | awk '{print $1}') == "2256x1504" ]; then
	gsettings set org.gnome.desktop.interface text-scaling-factor 0.8
fi
