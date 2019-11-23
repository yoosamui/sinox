#!/bin/bash

#--------------------
# needs root access
#--------------------

echo "copy files"


find /home/yoo/sinox/home/ -type f -print0 | xargs -0 sudo chmod 644
find /home/yoo/sinox/home/ -type d -print0 | xargs -0 sudo chmod 755
find /home/yoo/sinox/home/ -type f -print0 | xargs -0 sudo chmod -x

chown -R yoo:yoo /home/yoo/sinox/home/ *
chown -R yoo:yoo /home/yoo/sinox/home/ .

cp -rT /home/yoo/sinox/home /home/yoo


echo "done"
exit






