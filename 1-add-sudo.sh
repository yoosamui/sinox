#!/bin/bash

#--------------------
# needs root access
#--------------------

echo "get the sudo package"
apt install sudo

echo "# yoo user privilege specification" >> /etc/sudoers
echo "yoo	ALL=(ALL:ALL) ALL" >> /etc/sudoers

echo "done"
exit






