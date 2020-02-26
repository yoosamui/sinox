#!/bin/bash
sh ./add-sudo.sh
sh ./timezone-ntp.sh
sh ./sources_list.sh
sh ./software-full.sh
sh ./copy-files.sh

systemctl reboot

