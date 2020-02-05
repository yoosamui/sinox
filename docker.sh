#!/bin/sh
#--------------------
# needs root access
#--------------------
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce
systemctl status docker
usermod -aG docker ${USER}
su - ${USER}
id -nG
echo "done"

