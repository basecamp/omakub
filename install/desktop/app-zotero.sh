flatpak install flathub org.zotero.Zotero

# Make a small script to start zotero from the command line without having to
# run flatpak directly
mkdir -p ~/bin
cat << EOF > ~/bin/zotero
#!/usr/bin/env bash
flatpak run org.zotero.Zotero
EOF
chmod u+x ~/bin/zotero
