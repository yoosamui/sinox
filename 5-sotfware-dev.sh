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


# virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian buster contrib"

apt update
sudo apt install virtualbox-6.0 -y

add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian buster contrib"

# skype
wget https://repo.skype.com/latest/skypeforlinux-64.deb
dpkg -i skypeforlinux-64.deb

# Add debian-breezetheme to alternatives with higher priority than debian packages:
sudo update-alternatives --install /usr/share/sddm/themes/debian-theme sddm-debian-theme /usr/share/sddm/themes/debian-breeze 90
sudo update-alternatives --config sddm-debian-theme
# services
systemctl enable sddm.service 
sudo systemctl disable NetworkManager-wait-online.service
sudo systemctl disable smbd
sudo systemctl disable systemd-timesyncd.service
sudo systemctl enable chrony
