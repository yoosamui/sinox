#!/bin/bash

echo "install all software from debian repo"

apt update
apt upgrade -y

apt install --fix-missing \
install intel-microcode \
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
kde-spectacle \
clang-format \
software-properties-common \
vim \
vim-athena \
gnome-terminal \
mousepad \
rofi \
nemo \
thunar \
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
compton-conf \
nitrogen \
xautolock \
network-manager \
network-manager-gnome \
package-update-indicator \
lxpanel \
iperf \
curl \
numlockx \
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
inkscape \
libreoffice \
notification-daemon -y

apt update 
apt clean
