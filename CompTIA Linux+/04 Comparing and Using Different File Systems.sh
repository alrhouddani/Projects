# file systems
# Ext Extended file system verion 4
# XFS
# NTFS New Technology File System
# BTRS usefull for Network-attached storage

# make file system mkfs
ls /usr/sbin/mkfs*
#format disk ext4
sudo mkfs.ext4 /dev/nvme0n2p1
# add a lable for ext
sudo e2label /dev/nvme0n2p1 data
#format disk xfs
sudo mkfs.xfs /dev/nvme0n2p2
# add a lable for xfs
sudo xfs_admin -L dataxfs /dev/nvme0n2p2
#for swap we use mkswap nvme0n2p2
sudo mkswap /dev/nvme0n2p2

# tell the system to use it
sudo swapon /dev/nvme0n2p2
# turn off swap
sudo swapoff -a

#mount a disk but only temp
sudo mount /dev/nvme0n2p1 /mnt/data
mount
mount | grep data
#show stat of harddrives
df -h
df --all
# to make the mount consistent
less /etc/fstab
sudo nano /etc/fstab #then add the disk name /dev/nvme0n2p1
