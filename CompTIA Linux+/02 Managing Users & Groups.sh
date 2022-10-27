# create a user
# -c, --comment COMMENT
useradd -D # shows you the def settings whcih are stored in /etc/skel/
# conatins some def as well /etc/default/useradd

sudo useradd --password 'Kilokoli123' abbyrh
useradd --comment "abdellah rhoudddani" --expiredate 2022/12/31 --shell /bin/bash abby
# modify the user
usermod
# delete a user
sudo userdel abbyrh -r #best practice
sudo usermod --login abbyrh abby
#add a password for a user
# def password settings and so on are stored in /etc/login.defs
sudo cat /etc/shadow | tail # all passwords are stored in # etc/shadow
passwd --usage
passwd --help
sudo passwd abbyrh
# chage change the age of a password (expirey date )
sudo chage abbyrh
# check the prapertices of a user's password
sudo chage --list abbyrh

# all users are stored in /etc/passwd
sudo cat /etc/passwd | less
sudo cat /etc/passwd | tail
sudo cat /etc/passwd | grep abbyrh
# change shell for a user
chsh or usermod
getint

# create bulk users
touch /home/alrh/file1
nano /home/alrh/file1
#!/bin/bash

for users in $(cat /home/alrh/file1); do
    sudo useradd $users
    echo "$users created"
done
#check if user created
for i in $(cat /home/alrh/file1); do
    sudo id $i

done

# delete bulk users
for users in $(cat /home/alrh/file1); do
    sudo userdel -r $users
    echo "$users deleted"
done

awk -F: '{print $users}' /etc/passwd

for i in $(cat /home/alrh/file1); do
    sudo passwd $users
done
