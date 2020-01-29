#!/bin/bash

echo "install all software from debian repo"

apt update
apt upgrade -y
apt install \
openbox \
lightdm \
network-manager \
network-manager-gnome \
trayer \
gedit \
gnome-terminal -y

exit








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
thunar \
pulseaudio \
pavucontrol \
pasystray \
gmessage \
gedit \
geany \
viewnior \
compton \
lxpanel \
openbox \
openbox-menu \
gnome-calculator \
obconf \
obmenu \
lxappearance \
redshift-gtk \
sddm \
sddm-theme-debian-breeze \
chrony -y

echo "done"
#network-manager-gnome \ nm-applet
#kde-config-sddm \
#notification-daemon -y

