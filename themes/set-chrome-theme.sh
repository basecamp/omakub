# Update Brave theme (closes Brave first)
if gum confirm "Update Brave theme? If yes, Brave will be closed!"; then
    # 1) Quit Brave so the Preferences file is not overwritten on exit
    pkill -f brave

    while pgrep -f brave >/dev/null; do
        sleep 0.1
    done

    # 2) Edit the Preferences JSON inside Brave’s default profile
    PROFILE_DIR="$HOME/.config/BraveSoftware/Brave-Browser/Default"   # Brave’s path on Linux :contentReference[oaicite:0]{index=0}
    cd "$PROFILE_DIR" || { echo "Brave profile not found"; exit 1; }

    jq '.extensions.theme      += {"id":"user_color_theme_id","system_theme":0}'  Preferences >tmp && mv tmp Preferences
    jq ".browser.theme.color_scheme = $CHROME_COLOR_SCHEME |
        .browser.theme.color_variant = $CHROME_COLOR_VARIANT |
        .browser.theme.user_color    = $CHROME_COLOR"                              Preferences >tmp && mv tmp Preferences
    jq ".ntp += {\"custom_background_dict\":{\"background_url\": \"https://github.com/basecamp/omakub/blob/master/themes/$CHROME_BACKGROUND?raw=true\"}}" \
                                                                                   Preferences >tmp && mv tmp Preferences
    cd ~
fi