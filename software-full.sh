#!/bin/bash

echo "install all software from debian repo"

apt update
apt upgrade -y

apt install --fix-missing \
gnustep-gui-runtime \
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
mousepad \
rofi \
nemo \
keepassxc \
gitk \
blueman \
pulseaudio \
pavucontrol \
pasystray \
gmessage \
gedit \
geany \
viewnior \
clementine \
compton \
nitrogen \
xautolock \
network-manager \
network-manager-gnome \
package-update-indicator \
lxpanel \
iperf \
curl \
arandr \
nmap \
openbox \
openbox-menu \
xbacklight \
gufw \
galculator \
gnome-calculator \
clamav \
clamav-daemon \
clamtk \
transmission-gtk \
baobab \
lxtask \
obconf \
obmenu \
fbxkb \
bleachbit \
wireless-tools \
lxappearance \
x11-xserver-utils \
numix-icon-theme \
redshift-gtk \
xscreensaver xscreensaver-data-extra xscreensaver-gl-extra \
sddm \
sddm-theme-debian-breeze \
firefox-esr \
e2fsprogs \
gparted \
vlc \
gnome-disk-utility \
gnome-calendar \
gnome-multi-writer \
grub-customizer \
samba \
smbclient \
cifs-utils \
nfs-common \
inkscape \
libreoffice \
notification-daemon -y
apt-get install --fix-missing
apt update 
apt clean


echo "done"
#kde-config-sddm \
#dmesg
#modporbe
#dkms //remobe modules
#chrony \

