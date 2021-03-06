#!/bin/bash

#--------------------
# needs root access
#--------------------
echo "copy remaster files"

# copy home
cp -r home/. /home/$USER/

echo "change HOME permisions"
find /home/$USER -type f -print0 | xargs -0 chown -R $USER:$USER *
find /home/$USER -type d -print0 | xargs -0 chown -R $USER:$USER *

find /home/$USER -type f -print0 | xargs -0 chmod -R 644
find /home/$USER -type d -print0 | xargs -0 chmod -R 755

echo "copy to var"
mkdir -p /var/sinox
cp -r var/sinox/. /var/sinox/
chown -R root:root /var/sinox

#echo "change var permisions"
#find /var/sinox/docklight-3.0 -type f -print0 | xargs -0 chown -R $USER:$USER *
#find /var/sinox/docklight-3.0 -type d -print0 | xargs -0 chown -R $USER:$USER *
#chmod a+x /var/sinox/docklight-3.0/docklight
#chown -R $USER:$USER /var/sinox/docklight-3.0

find /var/sinox/scripts -type f -print0 | xargs -0 chmod a+x
chown -R root:root /var/sinox/scripts/*

echo "copy automount.pkla"
mkdir -p /etc/polkit-1/localauthority/50-local.d/automount.pkla
cp -r services/automount.pkla /etc/polkit-1/localauthority/50-local.d/automount.pkla
chown root:root /etc/polkit-1/localauthority/50-local.d/automount.pkla

#-  use the kde Notifications
#mkdir -p /usr/share/dbus-1/services
#cp -p services/org.freedesktop.Notifications.service /usr/share/dbus-1/services

echo "copy themes icons and change permisions"
mkdir -p /usr/share/themes
chown -R root:root /usr/share/themes

user_themes_folder='/home/'$USER'/.themes'
chown -R $USER:$USER ${user_themes_folder}

user_icons_folder='/home/'$USER'/.icons'
chown -R $USER:$USER ${user_icons_folder}


cp -r usr/share/themes/. /usr/share/themes/
#chown -R root:root  /usr/share/themes

find /usr/share/themes -type f -print0 | xargs -0 chown -R $USER:$USER *
find /usr/share/themes -type d -print0 | xargs -0 chown -R $USER:$USER *

echo "copy Notifications.service"
cp -r services/org.freedesktop.Notifications.service /usr/share/dbus-1/services/ 
chown -R root:root /usr/share/dbus-1/services/org.freedesktop.Notifications.service 

echo "nitrogen change user"
file1='/home/'$USER'/.config/nitrogen/bg-saved.cfg'
file2='/home/'$USER'/.config/nitrogen/nitrogen.cfg'
echo "file1"${file1}
echo "file2"${file2}
p1='s/'
p2='/g'
r='/'
l='USER'
c=${p1}${l}${r}$USER${p2}
sed -i ${c} ${file1}
sed -i ${c} ${file2}

# avatar
#echo "copy face avatar" 
#mkdir -p /usr/share/sddm/faces/
#chown -R root:root /usr/share/sddm/faces
#cp usr/share/sddm/faces/.face.icon /usr/share/sddm/faces/.face.icon

#chown -R root:root /usr/share/sddm/faces/.face.icon
#ls /usr/share/sddm/faces -al


#- grub template
cp  boot/grub/sinox-custom.cfg /boot/grub/sinox-custom.cfg
chown root:root /boot/grub/sinox-custom.cfg
  
# disable Nouveau kernel driver
# needs Regenerate the kernel initramfs:
cp etc/blacklist-nouveau.conf /etc/modprobe.d/blacklist-nouveau.conf
chown root:root /etc/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u

cp bin/trayer /bin


#cp etc/sources.list_clean /etc/apt/sources.list
#apt update



echo "done"
exit






