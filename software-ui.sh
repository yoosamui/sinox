#!/bin/bash

echo "install all software from debian repo"

apt update

apt install --fix-missing \
compton \
compton-conf \
openbox \
openbox-menu \
obconf \
obmenu \
lightdm  -y

apt update 
apt autoremove
apt clean
