# check file permissions
ls -l
# folders
d type of the object
rwx owner permissions
r-x other permissions
#
#User/owner(u), group(g), others(o)
- none
r read
w write
x Execute
# numerical values were
4 read
2 write
1 Execute
#Numerical notaion
#0	None
#1	Execute
#2	Write
#3	Write and Execute
#4	Read
#5	Read & Execute
#6	Read & Write
#7	Read, Write & Execute

# change and modify permissions
-rw-r--r--. 1 alrh alrh 0 Oct 25 17:14 file3
newgrp
chmod
sudo chmod g+w file3
-rw-rw-r--. 1 alrh alrh 0 Oct 25 17:14 file3
sudo chmod g+x file3
-rw-rwxr--. 1 alrh alrh 0 Oct 25 17:14 file3
# change permission and add a confirmation (- and +)
sudo chmod g-x file3 && ls -l file3
# add permissions to user group and others
sudo chmod u+x,g+rwx,o-r file3 && ls -l file3
#configer the permissions and over write them (using =)
chmod u=rwx,g=rw,o=r file3 && ls -l file3
chmod 770 file3 && ls -l file3

# defult permissions location cat .bashrc cat /etc/profile
umask
etc/
ls -l --all
ls -la #short
#Value	Results
#0	Read,Write & Execute
#1	Read & Write
#2	Read & Execute
#3	Read
#4	Write & Execute
#5	Write
#6	Execute
#7	No permissions

# change the group owner
chgrp
chown
#change both onwer and group
sudo chown abbyrh:marketing file1 && ls -l file1
#change the group only
sudo chown :sales folder1 && ls -l folder1
#change the onwer only
sudo chown abbyrh: file3 && ls -l file3
# change the onwer of all files ina  folder
sudo chown -R alrh:alrh /home/alrh*
