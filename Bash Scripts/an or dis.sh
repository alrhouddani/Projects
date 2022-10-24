#disable GUI
systemctl set-default multi-user.target
systemctl isolate multi-user.target
#enable GUI
systemctl isolate graphical.target
systemctl set-default graphical.target #it'll setup the gdm boot startup
startx
