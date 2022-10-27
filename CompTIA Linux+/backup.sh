#Topic: Securing Linux Systems
#Backup and Restore Data

#Incremental
#How are these backups stored?
#Physical Media
#Tape Optical HDD
#Digital Storage
#Snapshot
#Image Clone
#What is a quick and easy way to backup files?
tar
#Tape ARchiver Originally developed for tape Can be used with almost any media
#Create an archive
sudo tar cvzf backup.tgz /home/alrh/
#c = create v= verbose z= Gzip the file f= file name
#Extract an archive
sudo tar xvzf backup.tgz
tar xvzf ~/Documents2/ backup.tgz
#Can we tell tar to only backup files that have changed?
dar
#Disk ARchiver
#Replacement for tar
#Supports differential and incremental backups
#Create a full backup
dar -R /home/justitdude -c full.bak
#Create a differential backup
dar -R ~/Documents -c full.bak
#R <path>
#c =  -c  creates
dar -R /Documents -c diff1.bak -A full.bak
#Create incremental backups
dar -R /home/justitdude -c infull.bak -A ./full.bak.1.dar
# -A [path/]
#Restore backups
1. dar -x full.bak
2. dar -x incr1.bak -w
3. dar -x incr2.bak -w
#Can we backup an entire disk with dar?
dd
#Stands for "Copy and Convert"
#CC was already in use
#Can clone an entire disk
#Allows backups of almost any file system
#Copy a disk to another disk
dd if=/dev/sda of=/dev/sdb
#Make an image of a disk
dd if=/dev/sda of=drive_image.img
#id = input file of = output file
#Restore an image to a disk
dd if=drive_image.img of=/dev/sdb
#Are there any other backup technologies we should know about?
#Backup Utilities
#mirrorvg

tar
dar
scp
sftp
rsync
mirrorvg
