#!/bin/bash

read -p "are you sure to continue. Press [Enter] key to start cloning..."

mounted=$(cat /proc/mounts | grep -oP $2)
if [ ! -z $mounted ]; then
echo "ERROR: $2 is mounted"
exit
fi

if [ -z $1 ]; then
	echo "missing source partition" 
	exit
fi

if [ -z $2 ]; then
	echo "missing clone partition" 
	exit
fi

check_zero_error_code () {
	retval=$?
	if [ $retval -ne 0 ]; then 
		printf 'ERROR detected. Return code was not zero '
	 	echo $retval
		exit
	fi
}


# read last uuid
grub_custom_file='/boot/grub/custom.cfg'
line=$(head -n 1 $grub_custom_file)
last_uuid=$(echo $line | grep -i "#LAST_UUID=" | cut -d'=' -f2) 

if [ -z $last_uuid ]; then
	echo "ERROR: last uuid not found" 
	exit
fi

# sed chars
p1='s/'
p2='/g'
r='/'
l='UUID='


# read current uuid
clone_current_uuid=$(tune2fs -l $2 | grep -i "Filesystem UUID:" |  cut -d':' -f2)
clone_current_uuid=`echo $clone_current_uuid | sed -e 's/^[[:space:]]*//'`

# check equality
if [ "$last_uuid" != "$clone_current_uuid" ]; then  
    		
	# update custom.cfg
	c=${p1}$last_uuid${r}$clone_current_uuid${p2}

	sed -i ${c} $grub_custom_file
	echo "custom.cfg updated:" $c

fi 

last_uuid=$clone_current_uuid 
echo "clone_current_uuid="$last_uuid

# read current uuid from source partition
source_current_uuid=$(tune2fs -l $1 | grep -i "Filesystem UUID:" |  cut -d':' -f2)
source_current_uuid=`echo $source_current_uuid | sed -e 's/^[[:space:]]*//'`
echo "source_current_uuid="$source_current_uuid

# create clone
echo "start cloning. please wait..."
time dd if=$1 of=$2 status=progress bs=64K conv=noerror,sync


# create ramdom UUID
e2fsck $2 -f -y -C 0
#check_zero_error_code

tune2fs $2 -U random 
check_zero_error_code

clone_current_uuid=$(tune2fs -l $2 | grep -i "Filesystem UUID:" |  cut -d':' -f2)
clone_current_uuid=`echo $clone_current_uuid | sed -e 's/^[[:space:]]*//'`

echo ---------------------------------------
echo "new uuid created "$clone_current_uuid
echo ---------------------------------------

c=${p1}$last_uuid${r}$clone_current_uuid${p2}
sed -i ${c} $grub_custom_file
echo "custom.cfg updated:" $c


# mount clone
MOUNTPOINT="/media/"
MOUNTPOINT+=$clone_current_uuid
mkdir -p $MOUNTPOINT
mount $2 $MOUNTPOINT  
echo "mount point=" $MOUNTPOINT 

# replace clone fstab
p1='s/'
p2='/g'
r='/'
l='UUID='
c=${p1}${l}$source_current_uuid${r}${l}$clone_current_uuid${p2}
CLONE_FSTAB='/etc/fstab'
sed -i ${c} $MOUNTPOINT${CLONE_FSTAB}
echo "replace fstab" $c

cp $grub_custom_file $MOUNTPOINT$grub_custom_file

update-grub

# label the clone
tune2fs -L debian-clone $2

dt=$(date '+%d/%m/%Y %H:%M:%S');
clone_datetimedestdir="debiab-clone create date: "$dt
destdir='/home/clone-date.txt'
printf "%s" "$clone_datetimedestdir" > $MOUNTPOINT${destdir}


# umount and remove mount point
if [ -d $MOUNTPOINT ]; then
 umount $2  

 sleep 5
 echo "remove mount point " $MOUNTPOINT
 rm -d $MOUNTPOINT
fi

echo "install grub on sda"
grub-install /dev/sda
sleep 5
echo "done."


exit





