#!/bin/bash

cp etc/sources.list /etc/apt/sources.list

apt update
apt upgrade -y

echo "done"

