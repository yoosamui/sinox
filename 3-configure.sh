#!/bin/bash

#--------------------
# needs root access
#--------------------

echo "copy files"

#mv .git .git_

#find /home/yoo/sinox -type f -print0 | xargs -0 sudo chmod -R 644
#find /home/yoo/sinox -type d -print0 | xargs -0 sudo chmod -R 755

#chown -R yoo:yoo /home/yoo/sinox/home/ *
#chown -R yoo:yoo /home/yoo/sinox/home/ .

chmod +x /home/yoo/sinox/home/docklight_3.0.orig/src/docklight 

chown root:root /home/yoo/sinox/automount.pkla
cp /home/yoo/sinox/home/automount.pkla /etc/polkit-1/localauthority/50-local.d/automount.pkla

cp -rT /home/yoo/sinox/home /home/yoo



echo "done"
exit






