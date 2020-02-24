#!/bin/bash

https://www.youtube.com/watch?v=y7pETJpOQhg
https://averagelinuxuser.com/debian-10-after-install/#10-install-restricted-extras-packages +++


All possible things you can do after installing Debian 10:

1:10 Fix CD-ROM error
1:48 Switch to the fastest repository mirror
2:55 Add contrib and non-free repositories
3:23 Switch to Xorg
3:58 Add minimize button
4:27 Install Synaptic
5:09 Install microcode
5:40 Install build-essential
6:00 Install Drivers
7:33 Install restricted-extras (codecs, MS fonts)
8:00 Install VLC
8:22 Install and configure Firewall
9:46 Install backup program
10:11 Configure Swappiness
11:06 Speed up boot time
11:46 Enable Drive Cache
12:35 Xkill shortcut
13:15 Ctrl+Alt+T to open Terminal
13:47 Enable GNOME extensions
14:56 Install Desktop icons extension
15:26 Install additional themes
17:29 Add user image
17:47 Change LibreOffice look
18:25 Add Files bookmarks
19:07 Enable Tray icons
19:57 Enable Night Light
20:23 Firefox settings
21:30 Enable Snap and FlatPak
22:24 Extend the battery life for Laptops
22:54. Remove unnecessary apps








#/decrese the kernel swap time

#vmstat
#procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
# r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
# 0  0      0 12960048  40360 1069048    0    0    98     4  170 1027  5  2 94  0  0



#sudo nano /proc/sys/vm/swappiness 
#default 60 
#change to 10

#///


apt update

# Add debian-breezetheme to alternatives with higher priority than debian packages:
update-alternatives --install /usr/share/sddm/themes/debian-theme sddm-debian-theme /usr/share/sddm/themes/debian-breeze 91
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

