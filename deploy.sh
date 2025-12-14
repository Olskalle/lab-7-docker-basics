#!/bin/bash -x

docker stop nginx-cont
docker rm nginx-cont

sudo docker build -t nginx-server ./nginx
sudo docker run -d --name nginx-cont -p 54321:80 --restart unless-stopped nginx-server

sudo docker ps -a
sleep 5
curl 127.0.0.1:54321
sudo docker logs -n 10 nginx-cont