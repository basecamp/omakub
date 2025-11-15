#!/bin/bash

sudo apt install -y \
  build-essential pkg-config autoconf bison clang rustc pipx \
  libssl-dev libreadline-dev zlib1g-dev libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev libjemalloc2 \
  libvips imagemagick libmagickwand-dev mupdf mupdf-tools \
  redis-tools sqlite3 libsqlite3-0 libpq-dev postgresql-client postgresql-client-common

. /etc/os-release

if [ "$ID" == "ubuntu" ]; then
  sudo apt install libmysqlclient-dev
else
  cd /tmp
	wget -q "http://ftp.debian.org/debian/pool/main/m/mysql-8.0/libmysqlclient21_8.0.44-1_amd64.deb"
	wget -q "http://ftp.debian.org/debian/pool/main/m/mysql-8.0/libmysqlclient-dev_8.0.44-1_amd64.deb"
	sudo apt-get install -y --allow-downgrades ./libmysqlclient21_8.0.44-1_amd64.deb \
		./libmysqlclient-dev_8.0.44-1_amd64.deb
	rm libmysqlclient21_8.0.44-1_amd64.deb libmysqlclient-dev_8.0.44-1_amd64.deb
	cd -
fi