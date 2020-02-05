#!/bin/bash
#--------------------
# needs root access
#--------------------
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update -y
apt-get install docker-ce -y
#systemctl status docker
sudo usermod -aG docker ${USER}
sudo su - ${USER}
sudo id -nG
echo "done"

