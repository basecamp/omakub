# Function to check for latest release tag
get_latest_release() {
  curl --silent "https://api.github.com/repos/charmbracelet/gum/releases/latest" | # Get latest release from GitHub api
  grep '"tag_name":' |                                                            # Get tag line
  sed -E 's/.*"([^"]+)".*/\1/'                                                     # Extract version
}

# Get the latest version tag
LATEST_VERSION=$(get_latest_release)
echo "Latest version of gum: $LATEST_VERSION"

# Construct the download URL for the Linux AMD64 .deb package
DOWNLOAD_URL="https://github.com/charmbracelet/gum/releases/download/$LATEST_VERSION/gum_${LATEST_VERSION:1}_amd64.deb"

# Download the .deb package
curl -L "$DOWNLOAD_URL" -o gum.deb

# Install the .deb package
sudo dpkg -i gum.deb

# Clean up
rm gum.deb

# Verify installation
if command -v gum &> /dev/null
then
    echo "gum successfully installed!"
else
    echo "Failed to install gum."
    exit 1
fi
