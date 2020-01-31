#!/bin/bash

#--------------------
# needs root access
#--------------------

# Make the NetworkManager managed
echo "Make the NetworkManager managed"
nmfile='/etc/NetworkManager/NetworkManager.conf'

p1='s/'
p2='/g'
r='/'
search='managed=false'
replace='managed=true'
c=${p1}${search}${r}${replace}${p2}
sed -i ${c} ${nmfile}
cat ${nmfile}
exit

# avatar
echo "copy face avatar" 
mkdir -p /usr/share/sddm/faces/
chown -R root:root /usr/share/sddm/faces
cp usr/share/sddm/faces/.face.icon /usr/share/sddm/faces/.face.icon
chown -R root:root /usr/share/sddm/faces/.face.icon
ls /usr/share/sddm/faces -al


# skype
apt update
echo "install skype" 
wget https://repo.skype.com/latest/skypeforlinux-64.deb
skype_path='/home/'$USER'/sinox/skypeforlinux-64.deb'
sudo dpkg -i ${skype_path}

echo "--------------------------------------------------------------------------------------"
echo "SINOX complete que carallo!!! ;o)"
echo "if you need install the drivers now and then reboot."








