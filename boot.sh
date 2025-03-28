set -e

ascii_art='________                  __        ___.
\_____  \   _____ _____  |  | ____ _\_ |__
 /   |   \ /     \\__   \ |  |/ /  |  \ __ \
/    |    \  Y Y  \/ __ \|    <|  |  / \_\ \
\_______  /__|_|  (____  /__|_ \____/|___  /
        \/      \/     \/     \/         \/
'

echo -e "$ascii_art"
echo "=> Omakub is for fresh Ubuntu 24.04+ and Fedora 41+ installations!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

if [ "$OMAKUB_OS" = "ubuntu" ]; then
  # Update system and install Git
	sudo apt-get update >/dev/null
	sudo apt-get install -y git >/dev/null
elif [ "$OMAKUB_OS" = "fedora" ]; then
  # Update system and install Git
	sudo dnf update -y >/dev/null
	sudo dnf install -y git >/dev/null
fi

echo "Cloning Omakub..."
rm -rf ~/.local/share/omakub
git clone https://github.com/basecamp/omakub.git ~/.local/share/omakub >/dev/null
if [[ $OMAKUB_REF != "master" ]]; then
	cd ~/.local/share/omakub
	git fetch origin "${OMAKUB_REF:-stable}" && git checkout "${OMAKUB_REF:-stable}"
	cd -
fi

echo "Installation starting..."
source ~/.local/share/omakub/install.sh
