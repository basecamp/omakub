# Add add-apt-repository when not available

# Check if add-apt-repository is available
if ! command -v add-apt-repository &> /dev/null; then
    # Install software-properties-common
    sudo apt-get install -y software-properties-common
fi