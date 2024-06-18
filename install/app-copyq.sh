sudo add-apt-repository -y ppa:hluk/copyq
sudo apt update -y
sudo apt install -y copyq

# start copyq to create initial config files
copyq --start-server

while [ ! -d "$HOME/.config/copyq" ]; do
	echo "Waiting for copyq configuration path to exist..."
	sleep 1
done

copyq exit >/dev/null

COPYQ_COMMAND_SIZE=$(grep '^size=' ~/.config/copyq/copyq-commands.ini | cut -d= -f 2)
NEW_COPYQ_COMMAND_SIZE=$(($COPYQ_COMMAND_SIZE + 1))

# Ignore copying from windows that contain the title "Password"
cat <<EOF >>~/.config/copyq/copyq-commands.ini
$NEW_COPYQ_COMMAND_SIZE\Automatic=true
$NEW_COPYQ_COMMAND_SIZE\Command=copyq ignore
$NEW_COPYQ_COMMAND_SIZE\Icon=*
$NEW_COPYQ_COMMAND_SIZE\Name=Ignore *\"Password\"* window
$NEW_COPYQ_COMMAND_SIZE\Remove=true
$NEW_COPYQ_COMMAND_SIZE\Window=Password
EOF

sed -i '/^size=/d' ~/.config/copyq/copyq-commands.ini
echo "size=$NEW_COPYQ_COMMAND_SIZE" >>~/.config/copyq/copyq-commands.ini

copyq --start-server
