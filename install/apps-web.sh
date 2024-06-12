#!/usr/bin/env bash

# shellcheck disable=SC1090
for script in ~/.local/share/omakub/web-apps/*.sh; do source "$script"; done
