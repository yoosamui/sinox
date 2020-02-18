#!/bin/bash

echo "install from debian repo"

apt update
apt upgrade -y

# ui -------------------------------------------
apt install --fix-missing \
install intel-microcode \
gnustep-gui-runtime \
gnome-terminal \
software-properties-common \
thunar \
gedit \
openbox \
obconf \
obmenu \
lightdm \
gmessage -y
