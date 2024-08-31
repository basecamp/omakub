curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | bash -s -- --no-modify-path

# Import history for the current shell
$HOME/.atuin/bin/atuin import auto
