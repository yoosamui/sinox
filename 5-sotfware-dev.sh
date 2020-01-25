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
gitk \
thunar \
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
network-manager-gnome \
trayer \
lxrandr \
arandr \
nmap \
openbox \
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
disks \
wireless-tools \
lxappearance \
x11-xserver-utils \
numix-icon-theme \
redshift-gtk \
sddm \
sddm-theme-debian-breeze \
kde-config-sddm \
firefox-esr \
chromium \
gparted \
vlc \
chrony \
notification-daemon -y

apt install gnupg gnupg2 gnupg1
apt update
apt upgrade -y 

read -p "Please install drivers!!! reboot now !!!"
