#!/bin/bash

#--------------------
# needs root access
#--------------------

echo "copy files"

mv .git .git_

find /home/yoo/sinox -type f -print0 | xargs -0 sudo chmod -R 644
find /home/yoo/sinox -type d -print0 | xargs -0 sudo chmod -R 755
find /home/yoo/sinox/home/scripts -type d -print0 | xargs -0 sudo chmod +x *

chown -R yoo:yoo /home/yoo/sinox/home/ *
chown -R yoo:yoo /home/yoo/sinox/home/ .

chmod +x /home/yoo/sinox/home/docklight_3.0.orig/src/docklight 

chown root:root /home/yoo/sinox/automount.pkla
cp -p /home/yoo/sinox/automount.pkla /etc/polkit-1/localauthority/50-local.d/automount.pkla

cp -rT -p /home/yoo/sinox/home /home/yoo

#m -rf /home/yoo/sinox


echo "done"
exit






