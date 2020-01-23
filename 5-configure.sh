#!/bin/bash

#--------------------
# needs root access
#--------------------

echo "copy files"

#mv .git .git_

find home -type f -print0 | xargs -0 sudo chmod -R 644
find home -type d -print0 | xargs -0 sudo chmod -R 755
find home/scripts -type d -print0 | xargs -0 sudo chmod a+x *

chown -R $USER:$USER home/ *
chown -R $USER:$USER home/ .

chmod a+x home/docklight_3.0.orig/src/docklight 
chown $USER:$USER -R /home/$USER/docklight_3.0

chown root:root automount.pkla
mkdir -p /etc/polkit-1/localauthority/50-local.d/automount.pkla
cp -p automount.pkla /etc/polkit-1/localauthority/50-local.d/automount.pkla

cp -rT -p home /home/$USER
chown $USER:$USER -R /home/$USER



#m -rf /home/yoo/sinox


echo "done"
exit






