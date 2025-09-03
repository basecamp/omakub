#!/bin/bash

# Set XCompose
if [ -f ~/.XCompose ]; then
  rm ~/.XCompose
fi

tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/omakub/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$OMAKUB_USER_NAME"
<Multi_key> <space> <e> : "$OMAKUB_USER_EMAIL"
EOF

# Refresh XCompose
omakub-restart-xcompose