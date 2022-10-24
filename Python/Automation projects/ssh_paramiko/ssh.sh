FROM:
#PermitRootLogin prohibit-password
TO:
PermitRootLogin yes

sudo apt install openssh-server
systemctl enable ssh 

sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config