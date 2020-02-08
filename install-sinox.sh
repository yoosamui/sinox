#!/bin/bash

echo "START PART 1 ----------------------------------------------------------------------------------------------"
sh ./add-sudo.sh
sh ./timezone-ntp.sh
sh ./copy-files.sh
sh ./plymouth.sh
sh ./software-full.sh
sh ./software-extra.sh
sh ./docker.sh
sh ./update-fstab.sh

# sh ./sources_list.sh
# sh ./post-install.sh

exit





#-1
#sh ./update-fstab.sh

#-2
sh ./add-sudo.sh

#-3 
sh ./timezone-ntp.sh

#-4
sh ./sources_list.sh

#-5
#sh ./copy-files.sh

#-6
sh ./plymouth.sh

#-7
sh ./software-full.sh


sh ./copy-files.sh


#-8
#sh ./update-alternatives.sh






#-9
#sh ./docker.sh

#-10
#sh ./software-extra.sh

#-11
#sh ./optimizer.sh

#-12
#sh ./post-install.sh

echo "done"
