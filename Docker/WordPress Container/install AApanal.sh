apt update --yes && sudo apt upgrade --yes
apt install wget --yes
wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh
bash install.sh
sudo ufw enable
ufw status
aaPanel Internet Address: https://172.104.130.165:7800/5faba0c9
aaPanel Internal Address: https://172.104.130.165:7800/5faba0c9
username: iyvkcesz
password: e5dbf5e2
docker run --cap-add=NET_ADMIN -it ubuntu:16.04
