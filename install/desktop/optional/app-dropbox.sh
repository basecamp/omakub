if [ "$OMAKUB_OS" = "ubuntu" ]; then
  # Sync files across machines using https://dropbox.com
  sudo apt install -y nautilus-dropbox >/dev/null
fi

# Fedora doesn't support dropbox with nautilus integration
