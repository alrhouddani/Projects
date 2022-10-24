sudo apt-get update -y
sudo apt-get install xrdp -y
systemctl enable xrdp
sudo apt install xfce4 -y
apt-get install tasksel -y
lightdm
#Stop xrdp with
sudo service xrdp stop
sudo service xrdp start

#Edit the xrdp start script:
sudo nano /etc/xrdp/startwm.sh

#In this file, replace the lines

test -x /etc/X11/Xsession && exec /etc/X11/Xsession
exec /bin/sh /etc/X11/Xsession
with startxfce4

#(You can comment out lines by adding # at the start)

#Restart xrdp with
sudo service xrdp stop

Select Xrdp as the session, and log in.

adduser alrh
usermod -aG sudo alrh

### create ev
python3 -m venv d/home/alrh/Desktop/bot
source name-given/bin/activate
#acivate the env
sou
usermod -aG sudo alrh
#Find which target unit is used by default:
systemctl get-default
#To change boot target to the text mode:
sudo systemctl set-default multi-user.target
python3 -V
sudo apt-get --reinstall install python3-minimal
