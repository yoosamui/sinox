#1/bin/bash

# run as root
modules='/etc/initramfs-tools/modules'
cp -p 'etc/modules' ${modules}
grub='/etc/default/grub'

cp -p 'etc/grub' ${grub}

apt install plymouth
apt-get install plymouth plymouth-themes

/usr/sbin/plymouth-set-default-theme --list
# Then, to set your desired theme run: 
/usr/sbin/plymouth-set-default-theme -R joy

# If this command errors out with a message saying that firmware files are missing, you will have to install the package
# firmware-linux-nonfree. To do that, execute the following command:
update-grub2
update-initramfs -u
apt-get install firmware-linux-nonfree
update-initramfs -u



