#!/bin/bash
sh ./timezone-ntp.sh
sh ./add-sudo.sh
sh ./sources_list.sh
sh ./software-full.sh
sh ./copy-files.sh
#reboot
sh ./plymouth.sh
sh ./software-ui.sh
sh ./software-extra.sh
sh ./docker.sh
sh ./post-install.sh
sh ./update-fstab.sh
exit

#@//////////////////////
sh ./add-sudo.sh
sh ./sources_list.sh
sh ./timezone-ntp.sh
sh ./plymouth.sh
sh ./software-full.sh
sh ./software-extra.sh
sh ./docker.sh
sh ./copy-files.sh
#sh ./update-fstab.sh
sh ./post-install.sh
