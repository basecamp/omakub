if [[ -z $UTILS_SOURCED ]]; then
    source ~/.local/share/omakub/utils.sh
fi
ARCH=$(get_arch)
case "$ARCH" in
    --aarch64)
        cd /tmp
        curl -sSO https://downloads.1password.com/linux/tar/stable/aarch64/1password-latest.tar.gz
        curl -sSO https://downloads.1password.com/linux/tar/stable/aarch64/1password-latest.tar.gz.sig
        gpg --keyserver keyserver.ubuntu.com --recv-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
        gpg --verify 1password-latest.tar.gz.sig 1password-latest.tar.gz
        [ $? -eq 0 ] || { cd - && false; }
        sudo tar -xf 1password-latest.tar.gz
        sudo mkdir -p /opt/1Password
        sudo mv 1password-*/* /opt/1Password
        sudo /opt/1Password/after-install.sh
        cd -
    ;;
    --*)
        # Install 1password and 1password-cli single script
        curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
        sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg

        # Add apt repository
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" |
        sudo tee /etc/apt/sources.list.d/1password.list

        # Add the debsig-verify policy
        sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
        curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
        sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
        sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
        curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
        sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

        # Install 1Password & 1password-cli
        sudo apt update && sudo apt install -y 1password 1password-cli
    ;;
esac