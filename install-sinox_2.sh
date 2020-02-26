#!/bin/bash
sh ./plymouth.sh
sh ./software-ui.sh
sh ./software-extra.sh
sh ./docker.sh
sh ./post-install.sh
sh ./optimizer.sh
#sh ./update-fstab.sh

echo "--------------------------------------------------------------------------------------"
echo "SINOX installation complete"
echo "if you need install drivers do it now and then reboot."


cd drivers
ls -al
echo install driver

exit

