#!/bin/bash

#service docker restart
xhost +local:docker
usermod -a -G docker $USER
#DISPLAY_NUMBER=$(echo $DISPLAY | cut -d. -f1 | cut -d: -f2)
#echo display $DISPLAY_NUMBER


pkexec  docker run -d \
		--net host \
		-v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY \
		-v /dev/snd:/dev/snd --privileged \
		-v $HOME/Downloads:/root/Downloads \
		-v /media/yoo/Shared/documents:/root/documents \
		--name chrome_"$(date +%s)" \
		--device /dev/dri \
		-v /dev/shm:/dev/shm \
		jess/chrome

#		--user-data-dir=/data \
#		IMAGE_ID google-chrome \
#	-v $HOME/Downloads:/root/Downloads \
#	-v $HOME/.config/google-chrome/:/data    \# save state
#	-v /dev/snd:/dev/snd \
# --name chrome \




exit


