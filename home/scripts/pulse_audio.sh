#!/bin/bash

if [ -z $1 ]; then
    echo "Usage: pulse_audio mute"
    echo "Usage: pulse_audio +"
    echo "Usage: pulse_audio -"
else
	#pactl set-sink-volume $(pactl list short sinks | head -n1 | cut -f1) -5%
	for i in $(pactl list short sinks | cut -f1); do 

		case $1 in
			"mute") 
			pactl set-sink-mute $i toggle
			;;	
		
			"+") 
			pactl set-sink-volume $i +5%
			;;	
		
			"-") 
			pactl set-sink-volume $i -5%
			;;
			*) 
			echo "parameter $1 is not processed"
			;;
				
		esac
	done

fi
exit

