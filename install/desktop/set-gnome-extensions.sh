brew install pipx
pipx install gnome-extensions-cli --system-site-packages

# Pause to assure user is ready to accept confirmations
gum confirm "To install Gnome extensions, you need to accept some confirmations. Are you ready?"

# Install new extensions
gext install paperwm@paperwm.github.com
