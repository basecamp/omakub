#!/bin/bash

echo "Overwriting old zellij themes with new ones..."

if [ -d ~/.config/zellij/themes ]; then
    # Use shopt to handle the case where no files match
    shopt -s nullglob
    files=(~/.config/zellij/themes/*.kdl)
    shopt -u nullglob

    if [ ${#files[@]} -gt 0 ]; then
        for file in "${files[@]}"; do
            theme_name=$(basename "$file" .kdl)
            if [ -d ~/.local/share/omakub/themes/"$theme_name" ]; then
                cp ~/.local/share/omakub/themes/"$theme_name"/zellij.kdl ~/.config/zellij/themes/"$theme_name.kdl"
            fi
        done
    fi
fi