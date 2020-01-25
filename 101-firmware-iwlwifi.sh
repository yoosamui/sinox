#!/bin/bash

#--------------------
# needs root access
#--------------------
apt update 
apt-get install firmware-iwlwifi -y
sudo modprobe -r iwlwifi
sudo modprobe iwlwifi

exit
