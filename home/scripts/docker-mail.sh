#!/bin/bash

#service docker restart
xhost +local:docker 
usermod -a -G docker $USER
DISPLAY_NUMBER=$(echo $DISPLAY | cut -d. -f1 | cut -d: -f2)
echo display $DISPLAY_NUMBER
pkexec docker run -d --name thunderbird_"$(date +%s)" -v \
			/media/yoo/Shared/.thunderbird:/root/.thunderbird -v \
			/media/yoo/Shared/documents:/root/documents -v \
			/etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=:$DISPLAY_NUMBER yoo/mail


exit


 
