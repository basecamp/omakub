sudo apt install -y zsh
chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

cp ~/.local/share/omakub/configs/zshrc ~/.zshrc
