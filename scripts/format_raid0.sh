#/bin/bash
set -e

sudo apt update
sudo apt install mdadm -y

# remember to change --raid-devices number and add trailing devices
sudo mdadm --create --verbose /dev/md0 --level=0 --raid-devices=1 /dev/nvme1n1 --force
sudo mkfs.ext4 /dev/md0

sudo mkdir -p /data
UUID=$(sudo blkid /dev/md0 | grep -oP 'UUID="\K[^"]+')
echo "UUID=$UUID /data ext4 defaults,nofail 0 0" | sudo tee -a /etc/fstab
sudo mount -a

sudo chown -R $USER:$USER /data
sudo chmod 755 /data
