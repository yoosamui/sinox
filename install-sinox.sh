#!/bin/bash

#-1
sh ./add-sudo.sh

#-2 deprecated
#sh ./timezone-ntp.sh

#-3
sh ./sources_list.sh

#-4
sh ./update-fstab.sh

#-5
sh ./copy-files.sh

#-6
sh ./plymouth.sh

#-7
sh ./software-full.sh

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

