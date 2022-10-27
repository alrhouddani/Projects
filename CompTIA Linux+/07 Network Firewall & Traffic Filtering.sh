#ufw
#iptable
#firewalld
sudo dnf install firewalld
rpm -qa firewalld
firewall-cmd --permanent --add-port=3389/tcp
firewall-cmd --permanent --runtime-to-permanent

firewall-cmd --permanent --add-port=3389/tcp --permanent
success
firewall-cmd --reload
success
#see all zones
sudo firewall-cmd --get-zones
# find out which zone u r using
sudo firewall-cmd --get-default-zone
# check active zones
firewall-cmd --get-active-zones
#Create a custom zone
firewall-cmd --permanent --new-zone=testlab
firewall-cmd --reload
#View configuration for a zone
firewall-cmd --list-all #for the default zone
firewall-cmd --zone=work --list-all
cat /etc/systco

#view all rules
firewall-cmd status
