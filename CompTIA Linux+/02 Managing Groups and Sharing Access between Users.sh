# create a group
sudo groupadd marketing
tail /etc/group # show all created group
#delete group
groupdel
#modify a group
sudo groupmod --new-name sales Sales
# add a uer to a group all users have primary group u can have one only
#and secondary group
sudo gpasswd -add abbyrh marketing
sudo usermod --append --groups sales abbyrh
# change your primary group
newgrp wheel
# check if a user is added
sudo id abbyrh
groups abbyrh
# remove a user from a group
sudo gpasswd --delete abbyrh sales
# make a user an admin of a group --administrators
sudo gpasswd --administrators abbyrh marketing

# adding bulk users to a group
for users in $(cat /home/alrh/file1); do
    sudo usermod --append --groups sales $users
    echo "$users added to sales"
done

# remove a user from group
for users in $(cat /home/alrh/file1); do
    sudo gpasswd --delete $users sales
    echo "$users is removed from sales"
done
# list all groups
#Stream EDitor sed
tail /etc/group | sed alrh
# find infomations in etc
sudo getent passwd abbyrh
cat /etc/passwd | grep abbyrh #using grep
sudo getent group marketing
cat /etc/group | grep marketing #using grep
