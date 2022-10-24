sudo dnf upgrade
dnf grouplist -v
dnf install @basic-desktop-environment -y

#install XRDP

sudo dnf install xrdp -y
sudo systemctl enable xrdp --now
sudo systemctl status xrdp
systemctl set-default graphical.target
#allow rdp firewall
sudo dnf install firewalld
rpm -qa firewalld
firewall-cmd --add-port=3389/tcp
firewall-cmd --runtime-to-permanent

firewall-cmd --add-port=3389/tcp --permanent
success
firewall-cmd --reload
success
