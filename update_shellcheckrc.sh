#!/bin/bash
# Get the list of modified shell files
MODIFIED_FILES=$(git diff --name-only master | grep -E '\.sh$' || true)

# Update the .shellcheckrc file
if [ -n "$MODIFIED_FILES" ]; then
  # Remove previous entries
  sed -i '/^source=.*$/d' .shellcheckrc
  for file in $MODIFIED_FILES; do
    echo "source=$file" >>.shellcheckrc
  done

  # Add .shellcheckrc to the staging
  echo "Adding .shellcheck to the staging."
  git add .shellcheckrc
else
  echo "No modified shell files to check."
fi
