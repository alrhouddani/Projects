#partition types
#old style Master boot record MBR only supports 4 partitions
#GPT  new style GUID Partition Table 128 partitions
# work with partitions MBR
lsblk #list block devices/
#list the disk informations
sudo fdisk --list /dev/nvme0n2 #MBR use fdisk
# enter fdisk editor
sudo fdisk /dev/nvme0n2
#most common partition types
82 linux swap
#list all GPT partions
sudo gdisk -l /dev/nvme0n2
sudo gdisk /dev/nvme0n2

# parted tool that is not found in all distro
sudo parted /dev/sda3
