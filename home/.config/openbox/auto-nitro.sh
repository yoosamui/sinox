#!/bin/bash
#https://buntu4win.wordpress.com/2015/05/05/a-wallpaper-randomizer-for-openbox-based-on-nitrogen/
## Auto-Nitrogenium is a script to automatically change the wallpaper with Nitrogenium

# seconds
DELAY=300

while true; do
    # checking state of the screensaver, no need to change wallpapers, when screensaver is inactive
    INACTIVE_STATE="The screensaver is inactive"
    STATE=`gnome-screensaver-command -q`
    if [ "$STATE" = "$INACTIVE_STATE" ]; then
        # run nitrogenium.sh and sleep
        /home/$USER/.config/openbox/nitrogenium.sh &
        sleep $DELAY
    else
        sleep 60
    fi
done
