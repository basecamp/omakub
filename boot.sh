set -e

ascii_art='________                  __        ___.
\_____  \   _____ _____  |  | ____ _\_ |__
 /   |   \ /     \\__   \ |  |/ /  |  \ __ \
/    |    \  Y Y  \/ __ \|    <|  |  / \_\ \
\_______  /__|_|  (____  /__|_ \____/|___  /
        \/      \/     \/     \/         \/
'

echo -e "$ascii_art"
echo "=> BTR Omakub is for fresh Ubuntu 24.04+ installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

export BTR_OMAKUB_ROOT=$HOME/.local/share/omakub

echo "Cloning BTR Omakub..."
rm -rf "$BTR_OMAKUB_ROOT"
git clone https://github.com/rki-mf1/btr-omakub.git "$BTR_OMAKUB_ROOT" >/dev/null
if [[ $OMAKUB_REF != "master" ]]; then
	cd "$BTR_OMAKUB_ROOT"
	git fetch origin "${OMAKUB_REF:-stable}" && git checkout "${OMAKUB_REF:-stable}"
	cd -
fi

echo "Installation starting..."
source "$BTR_OMAKUB_ROOT/install.sh"
