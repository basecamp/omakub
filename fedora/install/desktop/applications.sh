#!/bin/bash

# Fedora-specific app overrides run first
for script in ~/.local/share/onyx/fedora/applications/*.sh; do source $script; done

# Shared apps (skip any already overridden above)
for script in ~/.local/share/onyx/applications/*.sh; do
  name=$(basename "$script")
  if [ ! -f ~/.local/share/onyx/fedora/applications/"$name" ]; then
    source $script
  fi
done
