if [ "$OMAKUB_OS" = "ubuntu" ]; then
  # OBS Studio is a screen recording application that allows you to capture both display and webcam in the same recording
  sudo apt install -y obs-studio
elif [ "$OMAKUB_OS" = "fedora" ]; then
  # OBS Studio is a screen recording application that allows you to capture both display and webcam in the same recording
  sudo dnf install -y obs-studio
fi
