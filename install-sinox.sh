#!/bin/bash

#-1


#-2
sh ./add-sudo.sh

#-3 deprecated
sh ./timezone-ntp.sh

#-4
sh ./sources_list.sh

#-5
sh ./copy-files.sh

#-6


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





sh ./plymouth.sh


sh ./update-fstab.sh
echo "done"
