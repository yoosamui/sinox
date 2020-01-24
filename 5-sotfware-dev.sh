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
conky \
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
firefox-esr \
gparted \
vlc \
chrony \
notification-daemon -y

# Add debian-breezetheme to alternatives with higher priority than debian packages:
sudo update-alternatives --install /usr/share/sddm/themes/debian-theme sddm-debian-theme /usr/share/sddm/themes/debian-breeze 90
sudo update-alternatives --config sddm-debian-theme
# services
systemctl enable sddm.service 
sudo systemctl disable NetworkManager-wait-online.service
sudo systemctl disable smbd
sudo systemctl disable systemd-timesyncd.service
sudo systemctl enable chrony
