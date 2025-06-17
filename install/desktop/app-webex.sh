DEB_URL="https://binaries.webex.com/WebexDesktop-Ubuntu-Official-Package/Webex.deb"
DOWNLOAD_DIR=$(mktemp -d)
trap "rm -rf $DOWNLOAD_DIR" EXIT
wget -O "$DOWNLOAD_DIR/webex.deb" "$DEB_URL"
sudo apt install -y "$DOWNLOAD_DIR/webex.deb"

# Without the following change webex will error out when launching it:
# https://community.cisco.com/t5/webex-meetings-and-webex-app/installing-webex-app-on-ubuntu-24-04/td-p/5163446
sudo bash -c "cat > /etc/apparmor.d/Webex" <<EOL
abi <abi/4.0>,
include <tunables/global>

profile Webex /opt/Webex/bin/CiscoCollabHost flags=(unconfined) {
  userns,

  # Site-specific additions and overrides. See local/README for details.
  include if exists <local/Webex>
}
EOL
sudo systemctl reload apparmor
