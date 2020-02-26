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

echo "[shared]" >>  /etc/samba/smb.conf
echo "path = /media/"$USER"/shared" >>  /etc/samba/smb.conf
echo "valid users = $USER" >>  /etc/samba/smb.conf
echo "read only = no" >>  /etc/samba/smb.conf
cat /etc/samba/smb.conf
echo "Please enter the password for samba. User="$USER
sudo smbpasswd -a $USER


echo "done"
