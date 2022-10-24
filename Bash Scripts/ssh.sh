ssh alrh@192.168.152.129

hostnamectl
ip -4 addr or ip -4 addr | grep inet
ss -ntl
cat >file

#checking the file permissions
ls -l
stat filepath
stat -c %a
tty can give u the path
ls -l $(tty)
umask shows permissions
mkdir --parents u/{d1,d2} # Make two subfolders inside ufolder
mkdir --parents file/sub/subsub
#chnaging permi to file (chown and chgrp)
sudo chown root:root f1
sudo chgrp root f1
#change or add user to a group
list all groups
$groups
sudo usermod
usermod -aG #--append --groups
id
newgrp wheel
sg
su -l
less /etc/passwd
cut -d: -f1 /etc/passwd
awk -F: '{ print $1}' /etc/passwd
getent passwd #show all users
getent group  #show all groups
groupadd      #create a group
### archiving files
sudo rm ./dir1/ -r
## creating Tar
sudo du -sh /etc
sudo tar -cf etc.tar /etcq
