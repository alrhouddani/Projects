#update repo
dnf update -y

#install xfce4

dnf groupinstall 'XFCE Desktop'
echo "exec /usr/bin/xfce4-session" >>~/.xinitrc
systemctl isolate graphical.target
systemctl set-default graphical.target

#install XRDP

sudo dnf install xrdp -y
sudo systemctl enable xrdp --now
sudo systemctl status xrdp

#allow rdp firewall
sudo dnf install firewalld
rpm -qa firewalld
firewall-cmd --add-port=3389/tcp
firewall-cmd --runtime-to-permanent
