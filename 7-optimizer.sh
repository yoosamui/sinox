#!/bin/bash

apt update

# Add debian-breezetheme to alternatives with higher priority than debian packages:
sudo update-alternatives --install /usr/share/sddm/themes/debian-theme sddm-debian-theme /usr/share/sddm/themes/debian-breeze 90
sudo update-alternatives --config sddm-debian-theme

# services
systemctl enable sddm.service 
sudo systemctl disable NetworkManager-wait-online.service
sudo systemctl disable smbd
sudo systemctl disable systemd-timesyncd.service
sudo systemctl enable chrony

echo "done"

