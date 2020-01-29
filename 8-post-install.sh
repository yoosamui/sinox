#!/bin/bash

#--------------------
# needs root access
#--------------------

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








