#1/bin/bash

apt update

# run as root
modules='/etc/initramfs-tools/modules'
cp -p 'etc/initramfs-tools/modules' ${modules}
chown root:root ${modules}

grub='/etc/default/grub'
cp -p 'etc/grub' ${grub}
chown root:root ${grub}

apt install plymouth -y
apt-get install plymouth-themes -y

/usr/sbin/plymouth-set-default-theme --list
/usr/sbin/plymouth-set-default-theme -R  joy

update-grub

#apt-get install firmware-linux-nonfree -y
sudo update-initramfs -u -k all
echo "done"



