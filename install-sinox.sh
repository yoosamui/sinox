#!/bin/bash

sh ./add-sudo.sh
sh ./sources_list.sh
sh ./timezone-ntp.sh
sh ./plymouth.sh
sh ./software-full.sh
sh ./software-extra.sh
sh ./docker.sh
sh ./copy-files.sh
sh ./update-fstab.sh
sh ./post-install.sh
