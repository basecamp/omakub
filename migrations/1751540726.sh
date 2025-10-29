if [ -f ~/.config/zellij/themes/tokyo-night.kdl ]; then
  echo "Updating Zellij theme to tokyo-night"
  cp -vf $OMAKUB_PATH/themes/tokyo-night/zellij.kdl ~/.config/zellij/themes/tokyo-night.kdl
else
  echo "Not using tokyo-night theme"
fi
