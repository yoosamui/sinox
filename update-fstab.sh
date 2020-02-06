#!/bin/bash

# replace  fstab

# https://wiki.debian.org/SSDOptimization
# http://blog.neutrino.es/2013/howto-properly-activate-trim-for-your-ssd-on-linux-fstrim-lvm-and-dmcrypt/
#
# In order to optimize the performance of the SSD, I strongly advise to avoid doing the TRIM operation in real time
# (whenever a file is deleted) because you would be putting an unnecessary extra amount of work over the SSD. 
# In other words: You should not enable the discard option in fstab.


root_uuid=$(cat /proc/cmdline |  grep -i "UUID=" |  cut -d'=' -f4)
root_uuid=${root_uuid:0:36}
p1="s/"
p2="/gb"
file="/etc/fstab"
search="UUID="$root_uuid
replace=$search$"  \/\	ext4    noatime,commit=600,defaults        0       2"
sed  -i  '/'"${search}"'/s/.*/'"${replace}"'/g' "${file}"
echo ""
echo "# ram disk for docklight" >> /etc/fstab
echo "tmpfs       /tmp/docklight tmpfs   nodev,nosuid,noexec,nodiratime,size=1024M" >> /etc/fstab
echo " " >> /etc/fstab 
echo "# Profile-sync-daemon" >> /etc/fstab
echo "# Syncs browser profiles to tmpfs reducing SSD/HDD calls and speeding-up browsers." >> /etc/fstab
echo "# https://wiki.ubuntuusers.de/SSD/Auslagerung/" >> /etc/fstab
echo "tmpfs /tmp tmpfs defaults,noatime,mode=1777 0 0" >> /etc/fstab
cat /etc/fstab

echo "done"

