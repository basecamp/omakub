sudo wget -O /usr/local/bin/ufw-docker https://github.com/chaifeng/ufw-docker/raw/master/ufw-docker
sudo chmod +x /usr/local/bin/ufw-docker

sudo ufw enable
sudo ufw-docker install

sudo ufw reload # Pull in new rules if already enabled

sudo ufw status verbose
sudo ufw-docker check
