#!/bin/bash

#https://www.youtube.com/watch?v=y7pETJpOQhg
#https://averagelinuxuser.com/debian-10-after-install/#10-install-restricted-extras-packages +++
#All possible things you can do after installing Debian 10:


#https://unix.stackexchange.com/questions/30286/can-i-configure-my-linux-system-for-more-#aggressive-file-system-caching

#You need root access to do this. You can run hdparm -W 0 /dev/sda command to disable write #caching,
# where you have to replace /dev/sda with device for your drive:
#sudo /sbin/hdparm  -W 1 /dev/sda6



#/decrese the kernel swap time

# vmstat
# procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
# r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
# 0  0      0 12960048  40360 1069048    0    0    98     4  170 1027  5  2 94  0  0



#sudo nano /proc/sys/vm/swappiness 
#default 60 
#change to 10

#///


apt update

#Install Restricted-extras packages
apt install ttf-mscorefonts-installer rar unrar libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-vaapi -y

# Configure Swappiness
echo "vm.swappiness = 10" >> /etc/sysctl.conf

# firewall
sudo ufw enable



# Add debian-breezetheme to alternatives with higher priority than debian packages:
#update-alternatives --install /usr/share/sddm/themes/debian-theme sddm-debian-theme /usr/share/#sddm/themes/debian-breeze 91
#update-alternatives --config sddm-debian-theme

# services
#systemctl enable sddm.service 

systemctl disable NetworkManager-wait-online.service

#systemctl disbale docker

#sudo systemctl disable smbd
#systemctl disable systemd-timesyncd.service
#sudo systemctl disable nmbd.service
#systemctl disable nvidia-persistenced.service
#systemctl enable chrony

echo "done"

