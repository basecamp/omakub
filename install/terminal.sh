# Needed for all installers
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip

#source the utils if not sourced already
if [[ -z $UTILS_SOURCED ]]; then
    source ~/.local/share/omakub/utils.sh
fi

# Run terminal installers
for installer in ~/.local/share/omakub/install/terminal/*.sh; do
    trap "handle_omakub_source_error $installer" ERR
    source "$installer" && handle_omakub_source_success "$installer"
    trap - ERR
done
