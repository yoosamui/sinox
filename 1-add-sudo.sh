#!/bin/bash

#--------------------
# needs root access
#--------------------
apt update 
apt upgrade -y

dpkg --add-architecture i386

echo "get the sudo package"
apt install sudo

# sed chars
p1='s/'
p2='/g'
r='/'
l='USER'
c=${p1}${l}${r}$USER${p2}
file='etc/sudoers'
dest='/etc'
echo ${c}
sed -i ${c} ${file}
cp -p ${file} ${dest}
ls ${r}${file} -la

chown root:root /etc/sudoers
echo "done. change to sudo"

# fstab
echo "# ram disk for docklight" >> /etc/fstab
echo "tmpfs       /tmp/docklight tmpfs   nodev,nosuid,noexec,nodiratime,size=1024M" >> /etc/fstab
echo " " >> /etc/fstab 
echo "# Profile-sync-daemon" >> /etc/fstab
echo "# Syncs browser profiles to tmpfs reducing SSD/HDD calls and speeding-up browsers." >> /etc/fstab
echo "# https://wiki.ubuntuusers.de/SSD/Auslagerung/" >> /etc/fstab
echo "tmpfs /tmp tmpfs defaults,noatime,mode=1777 0 0" >> /etc/fstab
echo "done"





