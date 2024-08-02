
```
lsblk

sudo lsblk -l

cfdisk -h


fdisk /dev/sdb

sudo mkfs.ext4 /dev/sdb1

sudo mkdir /mnt/newdisk

sudo mount /dev/sdb1 /mnt/newdisk

df -h

###to know the UUID of partition
sudo blkid  
sudo vi /etc/fstab

UUID=5ae70efc-57f7-486e-9758-0d59a1faf238 /mnt/newdisk ext4 defaults 0 2

sudo reboot


```