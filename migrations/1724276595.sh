echo "Hardening docker..."
echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5", "iptables":false}}' | sudo tee /etc/docker/daemon.json
echo "Enabling ufw firewall"
source $OMAKUB_PATH/install/ufw.sh
