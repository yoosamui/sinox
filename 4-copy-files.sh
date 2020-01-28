#!/bin/bash

#--------------------
# needs root access
#--------------------

echo "copy user files"

# copy home
cp -r home/. /home/$USER/

echo "change HOME permisions"
#chown $USER:$USER -R /home/$USER/.
find /home/$USER -type f -print0 | xargs -0 chown -R $USER:$USER *
find /home/$USER -type d -print0 | xargs -0 chown -R $USER:$USER *

find /home/$USER -type f -print0 | xargs -0 chmod -R 644
find /home/$USER -type d -print0 | xargs -0 chmod -R 755

echo "copy to var"
# copy to var
mkdir -p /var/sinoxls
cp -r var/sinox/. /var/sinox/
echo "change var permisions"

chown $USER:$USER /var/sinox
find /var/sinox/docklight-3.0 -type f -print0 | xargs -0 chown -R $USER:$USER *
find /var/sinox/docklight-3.0 -type d -print0 | xargs -0 chown -R $USER:$USER *
chmod a+x /var/sinox/docklight-3.0/docklight

find /var/sinox/scripts -type f -print0 | xargs -0 chmod a+x


#find home -type f -print0 | xargs -0 sudo chmod -R 644
#find home -type d -print0 | xargs -0 sudo chmod -R 755
#find home/scripts -type d -print0 | xargs -0 sudo chmod a+x *

#chown -R $USER:$USER home/ *
#chown -R $USER:$USER home/ .

#chmod a+x home/docklight_3.0.orig/src/docklight 

echo "copy automount.pkla"
chown root:root automount.pkla
mkdir -p /etc/polkit-1/localauthority/50-local.d/automount.pkla
cp -r -p automount.pkla /etc/polkit-1/localauthority/50-local.d/automount.pkla

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
echo "copy face avatar" 
mkdir -p /usr/share/sddm/faces/
chown -R root:root /usr/share/sddm/faces

cp usr/share/sddm/faces/.face.icon /usr/share/sddm/faces/.face.icon

#chown -R root:root /usr/share/sddm/faces/.face.icon
ls /usr/share/sddm/faces -al




#- move out in the clone script
#cp  custom.cfg /boot/grub/custom.cfg
#chown root:root /boot/grub/custom.cfg
  
echo "done"
exit






