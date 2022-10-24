sudo docker container --help
sudo docker container ps
docker create --help
sudo docker run nginx
docker images
which docker, apt list --installed | grep 'docker' and snap list
docker create postgres
docker container ps --all
docker container start 4ae1433440dc
docker logs 4ae1433440dc
docker container rm --help
sudo docker container rm 9b647efd91eb
docker create  --env POSTGRES_PASSWORD=Kilokoli123 postgres
## docker stop P
docker run --network host nginx
docker container rm --force 73
docker container pause --help
docker container pause c7ffca992c63
docker container unpause c7ffca992c63
docker conatiner stop --time 10s c7ffca992c63
#Interact with container
docker pull mcr.microsoft.com/powershell
docker container run --help
docker image list
docker container create --interactive --tty mcr.microsoft.com/powershell
docker container run --interactive --tty mcr.microsoft.com/powershell
docker exec --help
docker container prune --force
docker pull python
docker container run --interactive --tty python
#exec
docker container exec --help
docker container exec --interactive --tty 1845142e8bff  bash
set
psql --help
exit
#Create image and push it.
Docker image build 
docker image inspect 18642bc1b877
docker run --rm --interactive --tty 18642bc1b877
docker image build --tag alrh/apline:1.0 .
#applying a tag 
alrh/apline      1.0     d4478b33ac75   17 hours ago   32.2MB
 docker image tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
 docker image tag 19e009c3e610 alrh
docker image build --tag ssh:1.0 --file ubuntussh.dockerfile .

docker image build --tag ssh:1.0 --file ubuntussh.dockerfile .
#add a file to a container
docker image build --tag pyapp3:1.0 --file dockerfile . 
docker run --rm --interactive --tty 2a87ea01b4e0
docker image tag dba56780651b app.py:1.0

docker image build --tag azure:1.0 --file azure.dockerfile .
docker image build --tag pwsh:1.0 --file pwsh.dockerfile .

docker login -u "alrh" -p "Kilokoli123" docker.io
docker push azure:1.0
docker push alrh/devoplab:1.0
docker push alrh/devoplab:latest
 docker image --tag 258f49ab7bc0 alrh/devoplab
 docker image tag 258f49ab7bc0 alrh/devoplab:1.0
 docker push alrh/nano:tagname
 docker image tag 2a87ea01b4e0 alrh/pythonapp:v3

docker rm --force $(docker ps -a -q)
docker system prune
#docker Swarm
sudo docker swarm join
docker swarm join --token SWMTKN-1-0xk2eljg3phed17q210rbud700326v37cscn7opibos02yme8h-0r1w8mpxp28ynxkmn1r8w4c8x 192.168.197.131:2377
sudo docker info | grep Swarm

docker swarm 
sudo docker swarm init
sudo docker info | grep Nodes

sudo docker swarm join-token worker  #--quiet

SWMTKN-1-0xk2eljg3phed17q210rbud700326v37cscn7opibos02yme8h-0r1w8mpxp28ynxkmn1r8w4c8x
docker network list
sudo docker network inspect ingress
Docker service create --help
sudo docker service create nginx
docker service create --replicas 4 --name alrhcontainers nginx
docker service create --publish 80:80 --replicas 4 --name alrhcontainers nginx
docker service ps alrhcontainers
curl localhost

docker exec -it b9aa68ade533 /bin/bash