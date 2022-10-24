#update repo
sudo apt update --yes && sudo apt upgrade --yes
#Install xrdp
sudo apt install xrdp --yes
#enable xrdp
sudo systemctl enable xrdp
#check status of xrdp
sudo systemctl status xrdp
#install gnome desktop
sudo apt install ubuntu-mate-desktop --yes
#create an RDP user
adduser rdp
usermod -aG sudo rdpaccount

#In this file, replace the lines sudo nano /etc/xrdp/startwm.sh
test -x /etc/X11/Xsession && exec /etc/X11/Xsession
exec /bin/sh /etc/X11/Xsession
with mate-session
