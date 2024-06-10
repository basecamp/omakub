sudo apt install -y docker.io docker-buildx
sudo groupadd docker
sudo usermod -aG docker ${USER}

DOCKER_COMPOSE_VERSION="2.27.0"
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -sSL https://github.com/docker/compose/releases/download/v$DOCKER_COMPOSE_VERSION/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

sudo docker create --restart unless-stopped -p 3306:3306 --name=mysql8 -e MYSQL_ROOT_PASSWORD= -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql:8
sudo docker create --restart unless-stopped -p 6379:6379 --name=redis redis
sudo docker create --restart unless-stopped -p 5432:5432 --name=postgres16 -e POSTGRES_HOST_AUTH_METHOD=trust postgres16
