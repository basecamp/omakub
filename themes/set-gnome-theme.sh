#!/bin/bash

omaku_get_accent() {
    local -a PREFERRED_COLORS=("$@")
    get_system_accent_colors() {
        local range_output
        range_output=$(gsettings range org.gnome.desktop.interface accent-color 2>/dev/null)

        if [[ -z "$range_output" || "$range_output" == *"type is not an enumeration"* ]]; then
            echo ""
            return
        fi
        echo "$range_output" | tr -d "[]'" | tr ',' '\n' | awk 'NF'
    }

    local -a SYSTEM_COLORS
    readarray -t SYSTEM_COLORS < <(get_system_accent_colors)

    declare -A SYSTEM_SET
    for c in "${SYSTEM_COLORS[@]}"; do
        SYSTEM_SET["$c"]=1
    done

    local SELECTED="default"
    for color in "${PREFERRED_COLORS[@]}"; do
        if [[ -n "${SYSTEM_SET[$color]}" ]]; then
            SELECTED="$color"
            break
        fi
    done

    echo "$SELECTED"
}

OMAKUB_THEME_SUFFIX=""
if [[ "$OMAKUB_THEME_PEFER" == "dark" ]]; then
    OMAKUB_THEME_SUFFIX="-dark"
fi
if [ "$OMAKUB_THEME_STYLE" ]; then
    OMAKUB_THEME_STYLE="-${OMAKUB_THEME_STYLE}"
fi

gsettings set org.gnome.desktop.interface color-scheme "prefer-${OMAKUB_THEME_PEFER}"
gsettings set org.gnome.desktop.interface cursor-theme "Yaru"
gsettings set org.gnome.desktop.interface gtk-theme "Yaru${OMAKUB_THEME_STYLE}${OMAKUB_THEME_SUFFIX}"
gsettings set org.gnome.desktop.interface icon-theme "Yaru${OMAKUB_THEME_STYLE}${OMAKUB_THEME_SUFFIX}"

GNOME_CURRENT_ACCENTS=$(omaku_get_accent "${OMAKUB_THEME_ACCENT[@]}")
gsettings set org.gnome.desktop.interface accent-color "$GNOME_CURRENT_ACCENTS" 2>/dev/null || true

mkdir -p ~/.config/qt6ct

if [[ "$OMAKUB_THEME_PEFER" == "dark" ]]; then
    OMAKUB_THEME_SUFFIX="-Dark"
fi

OMAKUB_THEME_FONTANDSIZE='"'$(gsettings get org.gnome.desktop.interface font-name | tr -d "'" | awk '{
    size = $NF;
    name = "";
    for (i = 1; i < NF; i++) {
        if (i > 1) name = name " ";
        name = name $i;
    }
    print name "," size;
}')'"'
OMAKUB_THEME_FONTANDSIZE_MONO='"'$(gsettings get org.gnome.desktop.interface monospace-font-name | tr -d "'" | awk '{
    size = $NF;
    name = "";
    for (i = 1; i < NF; i++) {
        if (i > 1) name = name " ";
        name = name $i;
    }
    print name "," size;
}')'"'

printf "%s\n" \
    "[Appearance]" \
    "custom_palette=false" \
    "icon_theme=Yaru${OMAKUB_THEME_STYLE}${OMAKUB_THEME_SUFFIX}" \
    "standard_dialogs=gtk3" \
    "style=Adwaita${OMAKUB_THEME_SUFFIX}" \
    "" \
    "[Fonts]" \
    "general=$OMAKUB_THEME_FONTANDSIZE" \
    "fixed=$OMAKUB_THEME_FONTANDSIZE_MONO" \
    "" |
    tee ~/.config/qt6ct/qt6ct.conf >/dev/null

BACKGROUND_ORG_PATH="$HOME/.local/share/omakub/themes/$OMAKUB_THEME_BACKGROUND"
BACKGROUND_DEST_DIR="$HOME/.local/share/backgrounds"
BACKGROUND_DEST_PATH="$BACKGROUND_DEST_DIR/$(echo "$OMAKUB_THEME_BACKGROUND" | tr '/' '-')"

if [ ! -d "$BACKGROUND_DEST_DIR" ]; then mkdir -p "$BACKGROUND_DEST_DIR"; fi

[ ! -f "$BACKGROUND_DEST_PATH" ] && install "$BACKGROUND_ORG_PATH" "$BACKGROUND_DEST_PATH"
gsettings set org.gnome.desktop.background picture-uri "$BACKGROUND_DEST_PATH"
gsettings set org.gnome.desktop.background picture-uri-dark "$BACKGROUND_DEST_PATH"
gsettings set org.gnome.desktop.background picture-options 'zoom'

source "$OMAKUB_PATH/themes/set-qt6-theme.sh"
