#!/bin/bash

mkdir -p ~/.config/qt6ct
OMAKUB_THEME_PEFER=$(gsettings get org.gnome.desktop.interface color-scheme | tr -d "'")
if [[ "$OMAKUB_THEME_PEFER" == "prefer-dark" ]]; then
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
    "icon_theme=$(gsettings get org.gnome.desktop.interface gtk-theme | tr -d "'")" \
    "standard_dialogs=gtk3" \
    "style=Adwaita${OMAKUB_THEME_SUFFIX}" \
    "" \
    "[Fonts]" \
    "general=$OMAKUB_THEME_FONTANDSIZE" \
    "fixed=$OMAKUB_THEME_FONTANDSIZE_MONO" \
    "" |
    tee ~/.config/qt6ct/qt6ct.conf >/dev/null
