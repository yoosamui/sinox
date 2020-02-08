#!/bin/bash

# virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian buster contrib"
apt update
apt install virtualbox-6.0 -y
add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian buster contrib"


# skype
apt update
echo "install skype" 
wget https://repo.skype.com/latest/skypeforlinux-64.deb
skype_path='/home/'$USER'/sinox/skypeforlinux-64.deb'
sudo dpkg -i ${skype_path}
rm -f ${skype_path}



apt install --fix-missing \
samba \
smbclient \
cifs-utils \
nfs-common -y


# samba 
echo "Please enter the password for samba. User="$USER
sudo smbpasswd -a $USER


echo "done"
