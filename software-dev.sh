#!/bin/bash

echo "install all software from debian repo"

apt update
apt upgrade -y

apt install --fix-missing \
libnotify-bin \
libgconf-2-4 \
gnustep-gui-runtime \
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
gnupg \
gnupg1 \
gnupg2 \
notification-daemon -y

