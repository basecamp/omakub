# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true

# Set identification from install inputs
git config --global user.name "$OMAKUB_USER_NAME"
git config --global user.email "$OMAKUB_USER_EMAIL"
