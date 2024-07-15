mkdir -p ~/.local/bin
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin
mkdir -p ~/.config/oh-my-posh/themes
cp ~/.local/share/omakub/themes/tokyo-night/ohmyposh.json ~/.config/oh-my-posh/themes/theme.json