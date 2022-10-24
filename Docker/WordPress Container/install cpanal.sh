apt update --yes && sudo apt upgrade --yes
apt install screen -y
apt install libfindbin-libs-perl -y
apt install systemctl -y
systemctl set-default multi-user.target
apt install curl -y
cd /home && curl -o latest -L https://securedownloads.cpanel.net/latest && sh latest
