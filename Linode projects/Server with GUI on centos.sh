#update repo
sudo dnf install epel-release -y
#Install Xfce packages
sudo dnf groupinstall "Server with GUI" -y
#Switch to graphical target in systemd
systemctl isolate graphical.target
systemctl set-default graphical.target

#install XRDP
sudo dnf install xrdp -y
sudo systemctl enable xrdp --now
sudo systemctl status xrdp

#Reboot your PC

sudo reboot
