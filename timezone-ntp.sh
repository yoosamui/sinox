#!/bin/bash
#--------------------
# needs root access
#--------------------

sudo dpkg-reconfigure tzdata
cp etc/systemd/timesyncd.conf /etc/systemd/timesyncd.conf 
chown root:root /etc/systemd/timesyncd.conf
systemctl enable systemd-timesyncd
timedatectl set-ntp true 
systemctl status systemd-timesyncd
timedatectl



