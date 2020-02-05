#!/bin/bash

apt update

# Add debian-breezetheme to alternatives with higher priority than debian packages:
update-alternatives --install /usr/share/sddm/themes/debian-theme sddm-debian-theme /usr/share/sddm/themes/debian-breeze 91
update-alternatives --config sddm-debian-theme

# services
#systemctl enable sddm.service 

systemctl disable NetworkManager-wait-online.service
systemctl disbale docker

#systemctl disable smbd
#systemctl disable systemd-timesyncd.service
#systemctl disable nmbd.service
#systemctl disable nvidia-persistenced.service
#systemctl enable chrony

echo "done"

