#!/bin/bash

apt update 
apt install gnustep-gui-runtime -y

#-1
say " this will take some time. Relax take some cofee." 
sh ./add-sudo.sh

#-2 deprecated
#sh ./timezone-ntp.sh

#-3
sh ./sources_list.sh

#-4
sh ./copy-files.sh

#-5
sh ./plymouth.sh

#-6
sh ./software-full.sh

#-7
sh ./update-alternatives.sh

#-8
sh ./docker.sh

#-9
sh ./software-extra.sh

#-10
sh ./update-fstab.sh


#-12
sh ./optimizer.sh

#-13
sh ./post-install.sh

echo "done"

