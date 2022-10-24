192.168.152.134
#enable
systemctl isolate graphical.target
systemctl set-default graphical.target #it'll setup the gdm boot startup
startx

#dissable
systemctl set-default multi-user.target
systemctl isolate multi-user.target

# set the time
timedatectl set-timezone Europe/Warsaw
timedatectl
