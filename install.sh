# Libraries and infrastructure
sudo apt update -y
sudo apt install -y \
	docker.io docker-buildx \
	build-essential pkg-config autoconf bison rustc cargo clang \
	libssl-dev libreadline-dev zlib1g-dev libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev libjemalloc2 \
	libvips imagemagick libmagickwand-dev mupdf mupdf-tools \
	redis-tools sqlite3 libsqlite3-0 libmysqlclient-dev

# CLI apps
sudo apt install -y git curl fzf ripgrep bat eza zoxide btop apache2-utils
sudo snap install code zellij --classic

# GUI apps
sudo apt install -y xournalpp alacritty
sudo snap install 1password spotify vlc zoom-client signal-desktop pinta

# Installers
for script in ~/.omakub/install/*.sh; do source $script; done

# Start services
for script in ~/.omakub/start/*.sh; do source $script; done
