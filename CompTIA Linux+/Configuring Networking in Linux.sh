#old
ifconfig
route
#new
ip addr
ip route
#find the gatway

ip route | grep default
#DHCP
sudo dhclient
sudo dhclient -r
#Restarting the network service
#Most changes require restarting the network service
sudo service network restart
sudo systemctl restart network.service
# Where are the network interface configurations stored?
#Configuration using interface scripts
#Stored in /etc/sysconfig/network-scripts
#First part of name
#en = Ethernet
#wl = Wireless
#ww = Cellular (WWAN)
#Second part of name
#o = On-board
#p = PCI card
#s = Hotplug slot
sudo ls /etc/sysconfig/network-scripts/ifcfg-eno1
DEVICE=eno1
TYPE=Ethernet
BOOTPROTO=none
IPADDR0=192.168.0.2
PREFIX0=24
GATEWAY0=192.168.0.1
DEFROUTE=yes
DNS1=8.8.8.8
ONBOOT=yes
#ubuntu
/etc/network
cat interface
or /etc/netplan
cat 99_config.yaml
#tell netplan apply
sudo netplan apply

#globle settings centos
/etc/sysconfig/network-scripts/network # add settings here
#dns /etc//etc/sysconfig/network-scripts/network
/etc/resolv.conf
and
/etc/hosts
#hostname
cat /etc/hostname
#use hostnamectl to change name
sudo hostnamectl set hostname fedora-dev

#network manager is a tool
nmcli
nmcli device status
nmcli device show ens160
sudo nmcli connection edit ens160
save persistent
#after saving
sudo nmcli connection reload

#Troubleshooting Network Connections
ping
traceroute www.google.com
tracepath www.google.com
#IPv6
ping6
traceroute6
#dns lookip
nslookup www.google.com
dig www.google.com

sudo cat /etc/resolv.conf
#see open sessions

ss
ss -atp
ss -tp
ss --processes
# track the nework activities
sudo tcpdump -i ens160 >>netdata.txt

#telnet
sudo telnet 192.168.56.1
netcat
#using netcat
sudo nc 104.18.34.89 443
sudo nc www.pracuj.pl 443
# nmap vulnerability checking, port scanning
nmap 104.18.34.89 443
