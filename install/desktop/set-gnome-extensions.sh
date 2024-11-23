brew install pipx
pipx install gnome-extensions-cli --system-site-packages

# Pause to assure user is ready to accept confirmations
gum confirm "To install Gnome extensions, you need to accept some confirmations. Are you ready?"

# Install new extensions
gext install paperwm@paperwm.github.com

# TODO: make it optional to install Thinkpad Battery Threshold for those who want it.
# Sometimes this is required on old Thinkpads to get the battery to charge.
# gext install thinkpad-battery-threshold@marcosdalvarez.org
