#!/bin/bash
#--------------------
# needs root access
#--------------------
cp -p etc/sources.list /etc/apt/sources.list
apt update
apt upgrade -y

echo "done"

