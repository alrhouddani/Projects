#update repo
sudo apt update --yes && sudo apt upgrade --yes
#install docker.io
sudo apt install docker
#import the container image
docker pull mysql
#create the container
docker run --name linode_database -p 3306:3306 -e MYSQL_ROOT_PASSWORD=Password123 -d mysql

#connect to the container
docker exec -it linode_database /bin/bash
