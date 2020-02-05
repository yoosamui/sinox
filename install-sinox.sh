#!/bin/bash

#-1
sh ./add-sudo.sh
#-2
sh ./update-fstab.sh
#-3
sh ./sources_list.sh
#-4
sh ./copy-files.sh
#-5
sh ./plymouth.sh
#-6
sh ./timezone-ntp.sh
#-7
sh ./sotfware-full.sh
#-8
sh ./update-alternatives.sh
#-9
sh ./docker.sh
#-10
sh ./software-extra.sh
#-11
sh ./optimizer.sh
#-12
sh ./post-install.sh

echo "done"

