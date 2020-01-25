#!/bin/bash

# virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian buster contrib"

apt update
sudo apt install virtualbox-6.0 -y
add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian buster contrib"

# skype
wget https://repo.skype.com/latest/skypeforlinux-64.deb
apt update
dpkg -i skypeforlinapux-64.deb
rm -f skypeforlinux-64.deb

echo "done"
