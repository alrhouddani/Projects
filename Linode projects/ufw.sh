sudo ufw status numbered
sudo ufw delete 3
udo ufw delete allow 22/tcp
sudo ufw status
sudo ufw allow XXXX/tcp
# use a port other than the default/predictable 3306
# work outside, and close the door when you are done
sudo ufw deny XXXX/tcp
