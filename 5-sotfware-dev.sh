#!/bin/bash

echo "install all software from debian repo"

apt update
apt upgrade -y


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
software-properties-common \
vim \
vim-athena \
gnome-terminal \
rofi \
nemo \
blueman \
pulseaudio \
pulseaudio-bluetooth  \
pulseaudio-module-bluetooth \
pulseaudio-equalizer \
pulseaudio-jack \
pavucontrol \
pasystray \
gmessage \
gedit \
geany \
viewnior \
clementine \
compton \
nitrogen \
gnome-power-manager \
network-manager-gnome \
trayer \
lxrandr \
openbox \
xbacklight \
gufw \
galculator \
clamav \
clamav-daemon \
clamtk \
transmission-gtk \
lxtask \
obconf \
obmenu \
fbxkb \
wireless-tools \
lxappearance \
x11-xserver-utils \
numix-icon-theme \
redshift-gtk \
sddm \
sddm-theme-debian-breeze \
kde-config-sddm \
notification-daemon -y

# Add debian-breezetheme to alternatives with higher priority than debian packages:
sudo update-alternatives --install /usr/share/sddm/themes/debian-theme sddm-debian-theme /usr/share/sddm/themes/debian-breeze 90
sudo update-alternatives --config sddm-debian-theme
# services
systemctl enable sddm.service 
