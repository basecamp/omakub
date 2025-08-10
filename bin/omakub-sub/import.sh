#!/bin/bash
# This script installs an Omakub theme in an idempotent way.
# It prompts for the theme name and Git repo, sets up gnome.sh and tophat.sh,
# and updates Omakub's theme list only if needed.

set -e  # Exit immediately if any command fails

# ===== 1) Prompt user for theme information =====
read -rp "Enter theme name (e.g., osaka-jade): " THEME_NAME
read -rp "Enter theme Git repository URL: " THEME_REPO

# ===== 2) Define paths based on current user =====
USERNAME=$(whoami)
THEMES_DIR="/home/$USERNAME/.local/share/omakub/themes"   # Where themes are stored
OMAKUB_BIN_DIR="/home/$USERNAME/.local/share/omakub/bin/omakub-sub" # Path to omakub scripts
THEME_SH_FILE="$OMAKUB_BIN_DIR/theme.sh"                  # File where themes are listed

# ===== 3) Ensure themes directory exists =====
mkdir -p "$THEMES_DIR"   # Create folder if missing
cd "$THEMES_DIR"         # Move into themes directory

# ===== 4) Clone theme repo if not already present =====
if [ ! -d "$THEME_NAME" ]; then
    echo "Cloning $THEME_NAME..."
    git clone "$THEME_REPO" "$THEME_NAME"
else
    echo "Theme '$THEME_NAME' already exists, skipping clone."
fi

# ===== 5) Prepare gnome.sh script content =====
GNOME_SCRIPT=$(cat <<EOF
#!/bin/bash
OMAKUB_THEME_COLOR="green"
OMAKUB_THEME_BACKGROUND="$THEME_NAME/backgrounds/${THEME_NAME}-bg-2.jpg"
source \$OMAKUB_PATH/themes/set-gnome-theme.sh
EOF
)

# ===== 6) Create or update gnome.sh if needed =====
if [ ! -f "$THEME_NAME/gnome.sh" ] || ! diff -q <(echo "$GNOME_SCRIPT") "$THEME_NAME/gnome.sh" >/dev/null; then
    echo "$GNOME_SCRIPT" > "$THEME_NAME/gnome.sh"  # Write file
    chmod +x "$THEME_NAME/gnome.sh"               # Make it executable
    echo "Updated gnome.sh"
else
    echo "gnome.sh already up to date."
fi

# ===== 7) Prepare tophat.sh script content =====
TOPHAT_SCRIPT=$(cat <<EOF
#!/bin/bash
gsettings set org.gnome.shell.extensions.tophat meter-fg-color "#073028"
EOF
)

# ===== 8) Create or update tophat.sh if needed =====
if [ ! -f "$THEME_NAME/tophat.sh" ] || ! diff -q <(echo "$TOPHAT_SCRIPT") "$THEME_NAME/tophat.sh" >/dev/null; then
    echo "$TOPHAT_SCRIPT" > "$THEME_NAME/tophat.sh"  # Write file
    chmod +x "$THEME_NAME/tophat.sh"                 # Make it executable
    echo "Updated tophat.sh"
else
    echo "tophat.sh already up to date."
fi

# ===== 9) Add theme to THEME_NAMES in theme.sh if missing =====
# Capitalize the first letter of theme name for display
CAPITALIZED_THEME="$(tr '[:lower:]' '[:upper:]' <<< ${THEME_NAME:0:1})${THEME_NAME:1}"

if grep -q "\"$CAPITALIZED_THEME\"" "$THEME_SH_FILE"; then
    echo "$CAPITALIZED_THEME already present in theme.sh"
else
    # Insert before the closing parenthesis of THEME_NAMES array
    sed -i "/THEME_NAMES=(/ s/)/ \"$CAPITALIZED_THEME\")/" "$THEME_SH_FILE"
    echo "Added '$CAPITALIZED_THEME' to theme.sh"
fi

# ===== 10) Final message =====
echo "=== Done! You can now select '$CAPITALIZED_THEME' in omakub Themes. ==="
clear
source $OMAKUB_PATH/bin/omakub-sub/menu.sh
