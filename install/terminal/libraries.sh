#!/bin/bash

sudo apt install -y \
  build-essential pkg-config autoconf bison clang rustc pipx \
  libssl-dev libreadline-dev zlib1g-dev libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev libjemalloc2 \
  libvips imagemagick libmagickwand-dev mupdf mupdf-tools \
  redis-tools sqlite3 libsqlite3-0 libpq-dev postgresql-client postgresql-client-common

. /etc/os-release

if [ "$ID" == "ubuntu" ]; then
  sudo apt install -y libmysqlclient-dev
else
  sudo apt install default-libmysqlclient-dev
fi