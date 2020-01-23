#!/bin/bash

apt update
apt upgrade -y 

apt install build-essential git gitk \
clang-format libgtkmm-3.0-dev libwnck-3-dev autotools-dev \
autoconf libtool gettext autopoint intltool vim vim-athena   -y

vim --version

exit

 



