#update repo
sudo dnf upgrade --refresh
sudo dnf install \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
    https://dl.fedoraproject.org/pub/epel/epel-next-release-latest-9.noarch.rpm -y
#Install Xfce packages
sudo dnf groupinstall "Xfce" "base-x"

#Switch to graphical target in systemd
echo "exec /usr/bin/xfce4-session" >>~/.xinitrc

systemctl isolate graphical.target
systemctl set-default graphical.target

#install XRDP
sudo dnf install xrdp -y
sudo systemctl enable xrdp --now
sudo systemctl status xrdp

#Reboot your PC
sudo reboot

#allow rdp firewall
sudo dnf install firewalld
rpm -qa firewalld
firewall-cmd --add-port=3389/tcp
firewall-cmd --runtime-to-permanent
