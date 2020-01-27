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

echo "copy themes and change permisions"
mkdir -p /usr/share/themes
chown -R root:root /usr/share/themes

cp -r usr/share/themes/. /usr/share/themes/
#chown -R root:root  /usr/share/themes

find /usr/share/themes -type f -print0 | xargs -0 chown -R $USER:$USER *
find /usr/share/themes -type d -print0 | xargs -0 chown -R $USER:$USER *

echo "copy Notifications.service"
cp -r services/org.freedesktop.Notifications.service /usr/share/dbus-1/services/ 
chown -R root:root /usr/share/dbus-1/services/org.freedesktop.Notifications.service 

#- move out in the clone script
#cp  custom.cfg /boot/grub/custom.cfg
#chown root:root /boot/grub/custom.cfg
  
echo "done"
exit






