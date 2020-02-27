#!/bin/bash

#--------------------
# needs root access
#--------------------

# Make the NetworkManager managed
#echo "Make the NetworkManager managed"


nmfile='/etc/NetworkManager/NetworkManager.conf'
p1='s/'
p2='/g'
r='/'
search='managed=false'
replace='managed=true'
c=${p1}${search}${r}${replace}${p2}
sed -i ${c} ${nmfile}
cat ${nmfile}



# avatar
#echo "copy face avatar" 
#mkdir -p /usr/share/sddm/faces/
#chown -R root:root /usr/share/sddm/faces
#cp usr/share/sddm/faces/.face.icon /usr/share/sddm/faces/.face.icon
#chown -R root:root /usr/share/sddm/faces/.face.icon
#ls /usr/share/sddm/faces -al

# gedit for text/plain
echo " "
echo "xdg-mime"
touch "/home/"$USER"/.config/mimeapps.list"

xdg-mime default org.gnome.gedit.desktop  text/plain
xdg-mime default org.gnome.gedit.desktop  text/x-c
xdg-mime default okularApplication_pdf.desktop  application/pdf


#--eof--