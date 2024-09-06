echo "Integrating ufw firewall with Docker..."

# Drop "iptables": false option
echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json

source $OMAKUB_PATH/install/ufw.sh
