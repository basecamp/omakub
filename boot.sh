set -e

ascii_art='
________                  __     ______            __
\_____  \   _____ _____  |  | __|  ____|_____ ____|  |
 /   |   \ /     \\___  \ |  |/ /|  |__ |  __|/  __|  |
/    |    \  Y Y  \/ __ \|    < |   __ |  __|  {__|  |
\_______  /__|_|  (____  /__|_ \|__|   |____ \_______|  
        \/      \/     \/     \/            \/          
'

echo -e "$ascii_art"
echo "=> omakfed is for fresh Fedora 41 installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo dnf update -y >/dev/null
sudo dnf install -y git >/dev/null

echo "Cloning omakfed..."
rm -rf ~/.local/share/omakfed
git clone --branch 0.0.1 https://github.com/amarqs182/omakfed.git ~/.local/share/omakfed >/dev/null
# if [[ $omakfed_REF != "master" ]]; then
#     cd ~/.local/share/omakfed
#     git fetch origin "${omakfed_REF:-stable}" && git checkout "${omakfed_REF:-stable}"
#     cd -
# fi

echo "Installation starting..."
source ~/.local/share/omakfed/install.sh
