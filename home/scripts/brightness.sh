#!/bin/bash
#https://askubuntu.com/questions/62249/how-do-you-change-brightness-color-and-sharpness-from-command-line
if [ -z $1 ]; then
    echo "Usage: brighntess BRIGHTNESS"
    echo "BRIGHTNESS is a float (0.0-1.0)"
else
    xrandr --listmonitors | grep "^ " | cut -f 6 -d' ' | \
    xargs --replace=MONITOR xrandr --output MONITOR --brightness $1
fi
