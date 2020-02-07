#!/bin/bash

echo "install all software from debian repo"

apt update
apt upgrade -y

apt install --fix-missing \
gnustep-gui-runtime \
gnome-terminal \
software-properties-common \
thunar \
gedit \
openbox \
sddm \
sddm-theme-debian-breeze -y



#apt-get install --fix-missing
apt update 
apt clean


echo "done"
#kde-config-sddm \
#dmesg
#modporbe
#dkms //remobe modules
#chrony \

