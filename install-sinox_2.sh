#!/bin/bash
sh ./plymouth.sh
sh ./software-ui.sh
sh ./software-extra.sh
sh ./docker.sh
sh ./post-install.sh
sh ./optimizer.sh
sh ./update-fstab.sh

cd drivers
ls -al
echo install driver

exit

