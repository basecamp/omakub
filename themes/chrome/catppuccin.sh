cd ~/.config/google-chrome/Default
jq '.browser.theme.color_scheme = 2 | .browser.theme.color_variant = 1 | .browser.theme.user_color = 1579044' Preferences >tmp.json && mv tmp.json Preferences
jq '.ntp += {"custom_background_dict":{"background_url": "https://github.com/basecamp/omakub/blob/master/backgrounds/catppuccintotoro.png?raw=true"}}' Preferences >tmp.json && mv tmp.json Preferences
cd ~
