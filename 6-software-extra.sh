#!/bin/bash

# skype
wget https://repo.skype.com/latest/skypeforlinux-64.deb
sudo dpkg -i skypeforlinapux-64.deb

# virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian buster contrib"

apt update
apt install virtualbox-6.0 -y
add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian buster contrib"

echo "done"
