#!/bin/bash
# https://wiki.debian.org/wl
#--------------------
# needs root access BCM4352
#--------------------
apt update 
#apt-get install firmware-b43-installer
apt-get install linux-image-$(uname -r|sed 's,[^-]*-[^-]*-,,') linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') broadcom-sta-dkms
modprobe -r b44 b43 b43legacy ssb brcmsmac bcma
modprobe wl

exit
