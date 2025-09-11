#!/bin/bash

  LATEST_URL=$(curl -s https://gitlab.com/api/v4/projects/gitlab-org%2Fcli/releases | grep -o '"direct_asset_url":"[^"]*linux_amd64\.deb"' | head -1 | cut -d '"' -f 4)
  if [ -n "$LATEST_URL" ]; then
      DEB_FILE=$(basename "$LATEST_URL")
      curl -L -o "/tmp/$DEB_FILE" "$LATEST_URL"
      sudo dpkg -i "/tmp/$DEB_FILE"
      sudo apt-get install -f -y
      rm "/tmp/$DEB_FILE"
  fi