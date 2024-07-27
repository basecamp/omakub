# uninstall onlyoffice
sudo apt purge -y onlyoffice-desktopeditors

# remove repo
sudo rm /usr/share/keyrings/onlyoffice.gpg
sudo rm /etc/apt/sources.list.d/onlyoffice.list
sudo rm /etc/apt/sources.list.d/onlyoffice.list.save
