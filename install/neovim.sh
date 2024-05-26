if ! command -v neovim &>/dev/null; then
	sudo add-apt-repository -y ppa:neovim-ppa/stable
	sudo apt update -y
	sudo apt install -y neovim
	git clone https://github.com/LazyVim/starter ~/.config/nvim
fi
