#!/bin/bash

#--------------------
# needs root access
#--------------------

echo "get the sudo package"
apt install sudo

# sed chars
p1='s/'
p2='/g'
r='/'
l='USER'
c=${p1}${l}${r}$USER${p2}
file='etc/sudoers'
echo ${c}
sed -i ${c} ${file}

