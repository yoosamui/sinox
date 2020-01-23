#!/bin/bash

service docker restart
xhost +local:docker 
usermod -a -G docker $USER
DISPLAY_NUMBER=$(echo $DISPLAY | cut -d. -f1 | cut -d: -f2)
echo display $DISPLAY_NUMBER
#iexec docker run -d --name thunderbird_"$(date +%s)" -v \
#3			/media/yoo/Shared/.thunderbird:/root/.thunderbird -v \
#			/media/yoo/Shared/documents:/root/documents -v \
#			/etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=:$DISPLAY_NUMBER yoo/mail
#
			
#exec docker run -d yoo/firefox  \
#             --name firefox"$(date +%s)" \
#             --shm-size=2g \
#            --entrypoint "chromium-browser" \
#            --no-sandbox  \
#            --remote-debugging-address=0.0.0.0 \
#            --remote-debugging-port=9222 \
#			/etc/localtime:/etc/localtime:ro -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=:$DISPLAY_NUMBER 
#			/bin/bash

#run  -d  sinox/chrome   --entrypoint ""   --remote-debugging-address=0.0.0.0 --remote-debugging-port=9222 https://#www.chromestatus.com/
#exit
 .
# run as root
#docker run -ti -u 0 /dev/snd yoo/firefox /bin/bash
#docker run -ti -u 0 /dev/snd yoo/firefox /bin/sh

# foreground
#docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix yoo/firefox

# backgound
exec docker run --device /dev/snd --group-add audio -d --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix  -v /media/yoo/Downloads yoo/firefox
#exec docker run --group-add audio -d --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix  -v /media/yoo/Downloads yoo/firefox

#https://hub.docker.com/r/jlesage/firefox

# as root
#for images, use docker run -u 0 -it mycontainer bash
