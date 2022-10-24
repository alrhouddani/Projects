#update repo
sudo apt update --yes && sudo apt upgrade --yes
#create a user
useradd docker
sudo passwd docker
usermod -aG sudo docker
#install Docker

apt install docker.io

#install docker compose

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

#create the docker compose file
mkdir yacht
cd yacht
touch docker-compose.yml
nano docker-compose.yml
#Run the docker compose file
docker-compose up -d
docker ps
# login to yacht
#linodvmIP:8000
139.144.79.144:8000
Logins: admin@yacht.local
Password: pass

#runing a container with Yacht
