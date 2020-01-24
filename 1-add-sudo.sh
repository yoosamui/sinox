#!/bin/bash

#--------------------
# needs root access
#--------------------
apt update 
apt upgrade -y

echo "get the sudo package"
apt install sudo

# sed chars
p1='s/'
p2='/g'
r='/'
l='USER'
c=${p1}${l}${r}$USER${p2}
file='etc/sudoers'
dest='/etc'
echo ${c}
sed -i ${c} ${file}
cp -p ${file} ${dest}
ls ${r}${file} -la


 

echo "done"
