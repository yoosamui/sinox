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
echo "install skype" 
wget https://repo.skype.com/latest/skypeforlinux-64.deb
sudo dpkg -i skypeforlinapux-64.deb

lspci 
echo "SINOX complete. is needed install the drivers now and the reboot."







