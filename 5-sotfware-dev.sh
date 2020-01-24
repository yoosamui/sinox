#!/bin/bash

echo "install all software from debian repo"

apt install \
build-essential \
cmake \
libgtkmm-3.0-dev \
libwnck-3-dev \
autotools-dev \
autoconf \
libtool \
gettext \
autopoint \
intltool \
clang-format \
vim \
vim-athena \
gnome-terminal \
nemo \
gmessage \
gedit \
notification-daemon -y

