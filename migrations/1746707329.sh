# Overwrite old zellij themes with new ones
if [ -d ~/.config/zellij/themes ]; then
    files=()
    for file in ~/.config/zellij/themes/*.kdl; do
        if [[ -f "$file" ]]; then
            files+=("$file")
        fi
    done

    if [ ${#files[@]} -gt 0 ]; then
        for file in "${files[@]}"; do
            if [ -d "$OMAKUB_PATH/themes/$(basename "$file" .kdl)" ]; then
                cp "$OMAKUB_PATH/themes/$(basename "$file" .kdl)"/zellij.kdl ~/.config/zellij/themes/$(basename "$file" .kdl).kdl
            fi
        done
    fi
fi