cd ~/.config/google-chrome/Default
jq '.browser.theme.color_scheme = 1 | .browser.theme.color_variant = 1 | .browser.theme.user_color = 6632704' Preferences >tmp.json && mv tmp.json Preferences
jq '.ntp += {"custom_background_dict":{"background_url": "https://github.com/basecamp/omakub/blob/master/backgrounds/kanagawa.jpg?raw=true"}}' Preferences >tmp.json && mv tmp.json Preferences
cd ~
