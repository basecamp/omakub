#!/bin/bash

source "${OMAKUB_PATH:-$HOME/.local/share/omakub}/install/lib/compat.sh"

sudo apt install -y \
  build-essential pkg-config autoconf bison clang rustc pipx \
  libssl-dev libreadline-dev zlib1g-dev libyaml-dev libffi-dev libgdbm-dev libjemalloc2 \
  imagemagick libmagickwand-dev mupdf mupdf-tools \
  redis-tools sqlite3 libsqlite3-0 libmysqlclient-dev libpq-dev postgresql-client postgresql-client-common

# 26.04 folded libncurses5-dev into libncurses-dev, and dropped the plain libvips
# package in favour of the t64 runtime that libvips-tools pulls in.
apt_install_first libncurses-dev libncurses5-dev
apt_install_first libvips-tools libvips
