curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | bash -s -- --no-modify-path

# Import history for the current shell
$HOME/.atuin/bin/atuin import auto

cat <<EOF > $HOME/.atuin/key-bindings.bash
# Atuin key bindings

[[ $- =~ i ]] || return 0

# bind to ctrl-r, add any other bindings you want here too
bind -m '"\C-r": __atuin_history'
EOF
