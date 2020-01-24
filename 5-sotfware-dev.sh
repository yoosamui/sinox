#!/bin/bash

echo "install all software from debian repo"

apt install \
build-essential \
cmake \
libgtkmm-3.0-dev \
libwnck-3-dev \
autotools-dev \
autoconf \
libtool \
gettext \
autopoint \
intltool \
clang-format \
vim \
vim-athena \
gnome-terminal \
nemo \
gmessage \
gedit \
compton \
nitrogen \
gnome-power-manager \
trayer \
openbox \
redshift-gtk \
plasma-desktop  \
sddm \
sddm-theme-debian-breeze \
kde-config-sddm \
notification-daemon -y

# Add debian-breezetheme to alternatives with higher priority than debian packages:
sudo update-alternatives --install /usr/share/sddm/themes/debian-theme sddm-debian-theme /usr/share/sddm/themes/debian-breeze 90
sudo update-alternatives --config sddm-debian-theme
# services
systemctl enable sddm.service 
