#!/bin/bash

#--------------------
# needs sudo access
#--------------------

echo "copy files"


find home/ -type f -print0 | xargs -0 sudo chmod 644
find home/ -type d -print0 | xargs -0 sudo chmod 755
chown yoo:yoo home/*

cp -rf home/* ~/



echo "done"
exit






