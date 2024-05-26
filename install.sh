# Libraries and infrastructure
echo -e "\e[32mINSTALLING CORE DEVELOPMENT LIBRARIES\e[0m"
sudo apt update -y
sudo apt install -y \
	build-essential pkg-config autoconf bison rustc cargo clang \
	libssl-dev libreadline-dev zlib1g-dev libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev libjemalloc2 \
	libvips imagemagick libmagickwand-dev mupdf mupdf-tools \
	redis-tools sqlite3 libsqlite3-0 libmysqlclient-dev

# CLI apps
echo -e "\e[32mINSTALLING CLI APPSe[0m"
sudo apt install -y git curl fzf ripgrep bat eza zoxide btop apache2-utils
sudo snap install zellij --classic

# GUI apps
echo -e "\e[32mINSTALLING GUI APPSe[0m"
sudo apt install -y xournalpp alacritty
sudo snap install 1password spotify vlc zoom-client signal-desktop pinta
sudo snap install code --classic

# Installers
echo -e "\e[32mRUNNING CUSTOM INSTALLERSe[0m"
for script in ~/.omakub/install/*.sh; do source $script; done

# Start services
for script in ~/.omakub/start/*.sh; do source $script; done
