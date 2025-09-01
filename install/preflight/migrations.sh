#!/bin/bash

omakub_migrations_state_path=~/.local/state/omakub/migrations
mkdir -p $omakub_migrations_state_path

for file in ~/.local/share/omakub/migrations/*.sh; do
  touch "$omakub_migrations_state_path/$(basename "$file")"
done
