#!/bin/bash

#--------------------
# needs root access
#--------------------
apt update 
apt -y install nvidia-detect
nvidia-detect
apt install nvidia-driver -y

read -p "You need to reboot!!"
exit
