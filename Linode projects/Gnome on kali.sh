#update repo
sudo apt update --yes && sudo apt upgrade --yes
#Install xrdp
sudo apt install xrdp --yes
#enable xrdp
sudo systemctl enable xrdp
#check status of xrdp
sudo systemctl status xrdp
#install kali desktop
sudo apt install kali-desktop-gnome
#create an RDP user
adduser rdp
usermod -aG sudo rdpaccount
