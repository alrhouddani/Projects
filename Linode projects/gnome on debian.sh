#update repo
sudo apt update --yes
sudo apt upgrade --yes
#Install xrdp
sudo apt install xrdp --yes
#enable xrdp
sudo systemctl enable xrdp
#check status of xrdp
sudo systemctl status xrdp
#install kali desktop
sudo apt install tasksel
sudo tasksel install desktop gnome-desktop
sudo tasksel
#create an RDP user
adduser rdp
usermod -aG sudo rdpaccount

sudo apt install ubuntu-gnome-desktop --yes
#create an RDP user
adduser rdp
usermod -aG sudo rdpaccount
