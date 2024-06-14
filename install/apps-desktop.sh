#!/usr/bin/env bash

# shellcheck disable=SC1090
for script in ~/.local/share/omakub/applications/*.sh; do source "$script"; done
