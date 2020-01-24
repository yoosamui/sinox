#!/bin/bash

#--------------------
# needs root access
#--------------------
apt update 
apt-get install firmware-iwlwifi -y
modprobe -r iwlwifi
modprobe iwlwifi

exit
