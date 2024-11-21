ascii_art=$(cat <<'EOF'
                 _                    _    _           __ _      
  ___ _ __  __ _| |____ _ ___ ___ ___| |__| |_  _ ___ / _(_)_ _  
 / _ \ '  \/ _` | / / _` (_-</ -_)___| '_ \ | || / -_)  _| | ' \ 
 \___/_|_|_\__,_|_\_\__,_/__/\___|   |_.__/_|\_,_\___|_| |_|_||_|
EOF
)

# Define the color gradient (shades of cyan and blue)
colors=(
	'\033[38;5;81m' # Cyan
	'\033[38;5;75m' # Light Blue
	'\033[38;5;69m' # Sky Blue
	'\033[38;5;63m' # Dodger Blue
)

# Split the ASCII art into lines
IFS=$'\n' read -rd '' -a lines <<<"$ascii_art"

# Print each line with the corresponding color
for i in "${!lines[@]}"; do
	color_index=$((i % ${#colors[@]}))
	echo -e "${colors[color_index]}${lines[i]}"
done
