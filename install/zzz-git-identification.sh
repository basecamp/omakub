gum format "# Enter your git credentials"
git config --global user.name "$(gum input --placeholder 'Your name')"
git config --global user.email "$(gum input --placeholder 'Your email address')"
gum format "Thanks!"
