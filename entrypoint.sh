#!/bin/sh

ip link add name wlan0 type dummy
ifconfig wlan0 up
echo okay > /tmp/xochitl-simulation.txt

umount /dev/loop0
losetup -d /dev/loop0
rm img.img

losetup -f
fallocate -l 64M img.img
mkfs.ext4 img.img
losetup /dev/loop0 img.img
mount /dev/loop0 /home

mkdir -p /home/root/.local/share/remarkable/xochitl/

/usr/sbin/sshd -D -o ListenAddress=0.0.0.0
