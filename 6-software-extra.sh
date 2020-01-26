#!/bin/bash

# virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian buster contrib"

apt update
apt install virtualbox-6.0 -y
add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian buster contrib"

# skype

curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
echo "deb https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skypeforlinux.list

sudo apt update
sudo apt install skypeforlinux

#get https://repo.skype.com/latest/skypeforlinux-64.deb
#pt update
#pkg -i skypeforlinapux-64.deb
#rm -f skypeforlinux-64.deb

echo "done"
