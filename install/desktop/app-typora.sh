if [ "$OMAKUB_OS" = "ubuntu" ]; then
  wget -qO - https://typora.io/linux/public-key.asc | sudo tee /etc/apt/trusted.gpg.d/typora.asc
  sudo add-apt-repository -y 'deb https://typora.io/linux ./'
  sudo apt update -y
  sudo apt install -y typora

  # Add iA Typora theme
  mkdir -p ~/.config/Typora/themes
  cp ~/.local/share/omakub/configs/typora/ia_typora.css ~/.config/Typora/themes/
  cp ~/.local/share/omakub/configs/typora/ia_typora_night.css ~/.config/Typora/themes/
elif [ "$OMAKUB_OS" = "fedora" ]; then
  sudo snap install typora
fi
