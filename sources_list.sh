#!/bin/bash
#--------------------
# needs root access
#--------------------
#cp -p etc/sources.list /etc/apt/sources.list

#buster backports
echo "deb http://deb.debian.org/debian buster-backports main contrib non-free" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian buster-backports main contrib non-free" >> /etc/apt/sources.list

apt update
apt upgrade -y

echo "done"

