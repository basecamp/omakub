echo "Enter git identification..."
SYSTEM_NAME=$(getent passwd "$USER" | cut -d ':' -f 5 | cut -d ',' -f 1)
export OMAKUB_GIT_NAME=$(gum input --placeholder "Enter full name" --value "$SYSTEM_NAME" --prompt "Name> ")
export OMAKUB_GIT_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")
