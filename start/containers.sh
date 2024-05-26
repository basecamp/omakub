docker create -d --restart unless-stopped -p 3306:3306 --name=mysql8 -e MYSQL_ROOT_PASSWORD= -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql:8
docker create -d --restart unless-stopped -p 6379:6379 --name=redis redis
