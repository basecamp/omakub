# Chrome theme update
if gum confirm "Do you want to update Chrome theme? If yes, Chrome will be restarted!"; then
	pkill -f chrome

	while pgrep -f chrome >/dev/null; do
		sleep 0.1
	done

	cd ~/.config/google-chrome/Default
	jq '.extensions.theme += {"id": "user_color_theme_id", "system_theme": 0}' Preferences >tmp.json && mv tmp.json Preferences
	jq ".browser.theme.color_scheme = $CHROME_COLOR_SCHEME | .browser.theme.color_variant = $CHROME_COLOR_VARIANT | .browser.theme.user_color = $CHROME_COLOR" Preferences >tmp.json && mv tmp.json Preferences
	jq ".ntp += {\"custom_background_dict\":{\"background_url\": \"https://github.com/basecamp/omakub/blob/master/themes/$CHROME_BACKGROUND?raw=true\"}}" Preferences >tmp.json && mv tmp.json Preferences
	cd ~

	google-chrome >/dev/null 2>&1 &
fi
