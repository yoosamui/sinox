#!/bin/bash
sh ./timezone-ntp.sh
sh ./add-sudo.sh
sh ./sources_list.sh
sh ./software-full.sh
sh ./copy-files.sh

systemctl reboot

