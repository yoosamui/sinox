#!/bin/bash

#--------------------
# needs root access
# https://wiki.archlinux.org/index.php/Rofi
#--------------------

echo "install all software from debian repo"
apt update
apt upgrade -y

apt install \
build-essential \
cmake \
git \
gitk \
network-manager \
network-manager-gnome \
libgtkmm-3.0-dev \
libwnck-3-dev \
autotools-dev \
autoconf \
pk-update-icon \
rofi \
blueman \
clementine \
libtool \
gettext \
autopoint \
intltool \
clang-format \
vim \
vim-athena \
fortunes \
cowsay \
fortune-mod \
firefox-esr \
pavucontrol \
nemo \
redshift \
redshift-gtk \
gedit \
firefox-esr \
gnome-terminal \
openbox \
sddm \
gmessage \
compton \
lightdm \
gdm3 \
arandr \
grub-customizer \
gnome-settings-daemon \
notification-daemon \
lxappearance \
nitrogen \
policykit-1-gnome \
chromium \
gparted \
geany \
lxinput \
gawk \
exuberant-ctags \
lxrandr \
lxtask \
vlc \
rofi \
transmission -y


apt update
apt autoremove -y

echo "done"

echo "install docker"
#apt install apt-transport-https ca-certificates curl software-properties-common -y
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#apt-get update
#apt-get install docker.io -y


echo "done"

#/sbin/shutdown -r now

exit





