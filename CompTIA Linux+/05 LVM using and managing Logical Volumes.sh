lvm
/dev/nvme0n2p2

# create logical volumes
#Physical volumes
sudo pvcreate /dev/nvme0n2p1 /dev/nvme0n2p2
#show the Physical volumes
sudo pvdisplay or sudo pvs
#valumes group
sudo vgcreate vg1 /dev/nvme0n2p1 /dev/nvme0n2p2
#show the valumes group
sudo vgdisplay or sudo vgs
#create logical valumes
sudo lvcreate -L 3G vg1 -n lv1
#show the logical valumes
sudo lvdisplay sudo lvs
# scan the system for valumes
sudo pvscan
#format logical valumes
sudo mkfs.ext4 /dev/vg1/lv1
sudo mount /dev/vg1/lv1 /home/alrh/lv1/ #mount
sudo umount /dev/vg1/lv1                # umount

# increase storage
# add and format a disk
sudo pvcreate /dev/nvme0n3p1
#extand the valume group
sudo vgextend vg1 /dev/nvme0n3p1
#extand logical valumes
sudo lvresize -L +5G /dev/vg1/lv1
sudo lvs # view the size

#use ext4
# "e2fsck" used to check the ext2/ext3/ext4 family of file systems.
sudo e2fsck -f /dev/vg1/lv1
sudo resize2fs /dev/vg1/lv1

#remove the logical valumes
sudo lvremove /dev/vg1/lv1
#remove the valumes group
sudo vgremove /dev/vg1
#remove the Physical volumes
sudo pvremove /dev/nvme0n2p1 /dev/nvme0n2p2 /dev/nvme0n3p1
/dev/nvme0n2p1
/dev/nvme0n2p2
/dev/nvme0n3p1
