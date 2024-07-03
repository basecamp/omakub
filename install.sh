# Exit immediately if a command exits with a non-zero status
# set -e

# Abort installation if the system is either not Ubuntu or not Ubuntu 24.04
# Function to compare version numbers
version_compare() {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}

# Check if the system is Ubuntu
if [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    if [ "$DISTRIB_ID" != "Ubuntu" ]; then
        echo "This script is intended for Ubuntu systems only."
        exit 1
    fi
else
    echo "This script is intended for Ubuntu systems only."
    exit 1
fi

# Get Ubuntu version
ubuntu_version=$(lsb_release -rs)

# Minimum required version
min_version="24.04"

# Compare versions
version_compare $ubuntu_version $min_version
result=$?

if [ $result -eq 2 ]; then
    echo "Error: Ubuntu version $ubuntu_version is lower than the required version $min_version"
    exit 1
else
    echo "Success: Ubuntu version $ubuntu_version meets the minimum requirement of $min_version"
    exit 0
fi


# Desktop software and tweaks will only be installed if we're running Gnome
RUNNING_GNOME=$([[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]] && echo true || echo false)

if $RUNNING_GNOME; then
	# Ensure computer doesn't go to sleep or lock while installing
	gsettings set org.gnome.desktop.screensaver lock-enabled false
	gsettings set org.gnome.desktop.session idle-delay 0

	echo "Get ready to make a few choices..."
	source ~/.local/share/omakub/install/terminal/required/app-gum.sh >/dev/null
	source ~/.local/share/omakub/first_run_choices.sh

	echo "Installing terminal and desktop tools.."
else
	echo "Only installing terminal tools..."
fi

# Install terminal tools
source ~/.local/share/omakub/install/terminal.sh

if $RUNNING_GNOME; then
	# Install desktop tools and tweaks
	source ~/.local/share/omakub/install/desktop.sh

	# Revert to normal idle and lock settings
	gsettings set org.gnome.desktop.screensaver lock-enabled true
	gsettings set org.gnome.desktop.session idle-delay 300
fi

