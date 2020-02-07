#!/bin/bash

echo "install from debian repo"

apt update
apt upgrade -y

# ui -------------------------------------------
apt install --fix-missing \
gnustep-gui-runtime \
gnome-terminal \
software-properties-common \
thunar \
gedit \
openbox \
obconf \
obmenu \
sddm \
sddm-theme-debian-breeze \
xscreensaver xscreensaver-data-extra xscreensaver-gl-extra \
lxpanel \
lxappearance \
compton \
nitrogen \
compton-conf \
notification-daemon  \
package-update-indicator \
gmessage -y

#utils ----------------------------------------------
apt update 
apt install --fix-missing \
xautolock \
e2fsprogs \
iperf \
curl \
numlockx \
arandr \
nmap \
xbacklight \
fbxkb \
wireless-tools \
grub-customizer \
redshift-gtk \
wireless-tools \
rofi -y

#network ----------------------------------------
apt update 
apt install --fix-missing \
samba \
smbclient \
cifs-utils \
nfs-common \
network-manager \
network-manager-gnome -y

# audio
apt update 
apt install --fix-missing \
blueman \
pulseaudio \
pavucontrol \
pasystray -y

# apps
apt update 
apt install --fix-missing \
inkscape \
libreoffice \
gnome-disk-utility \
gnome-calendar \
gnome-multi-writer \
gparted \
vlc \
firefox-esr \
gedit \
geany \
mousepad \
viewnior \
nemo \
keepassxc \
clementine -y

# development
apt update 
apt install --fix-missing \
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
gitk -y

