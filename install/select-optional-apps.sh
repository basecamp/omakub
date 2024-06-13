# Install optional apps
apps=$(gum choose "1password" "1password-cli" "Spotify" "Zoom" "Dropbox" "VirtualBox" --no-limit --selected "1password","1password-cli","Spotify","Zoom" --height 7 --header "Select commercial apps")

for app in $apps; do
	source "$OMAKUB_PATH/install/optional/app-${app,,}.sh"
done
