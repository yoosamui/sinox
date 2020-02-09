#!/bin/bash

#--------------------
# needs root access
#--------------------

echo "deb http://deb.debian.org/debian buster-backports main contrib non-free" >> /etc/apt/sources.list
apt-get install linux-headers-$(uname -r|sed 's/[^-]*-[^-]*-//') -y

apt update 
apt -y install nvidia-detect
nvidia-detect
apt install nvidia-driver -y

read -p "You need to reboot!!"
exit
