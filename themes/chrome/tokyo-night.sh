cd ~/.config/google-chrome/Default
jq '.extensions.theme += {"id": "user_color_theme_id", "system_theme": 0}' Preferences >tmp.json && mv tmp.json Preferences
jq '.browser.theme.color_scheme = 2 | .browser.theme.color_variant = 1 | .browser.theme.user_color = 3094106' Preferences >tmp.json && mv tmp.json Preferences
jq '.ntp += {"custom_background_dict":{"background_url": "https://github.com/basecamp/omakub/blob/master/backgrounds/80s-retro-tropical-sunset-by-freepik.jpg?raw=true"}}' Preferences >tmp.json && mv tmp.json Preferences
cd ~
