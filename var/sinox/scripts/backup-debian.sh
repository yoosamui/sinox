#!/bin/bash

#https://linux.101hacks.com/unix/e2fsck/
#https://askubuntu.com/questions/29370/how-to-check-if-a-command-succeeded




if [ -z $1 ]; then
	echo "minimal backup" 
	
	
else
	echo "backup all" 

fi


check_zero_error_code () {
	retval=$?
	if [ $retval -ne 0 ]; then 
		printf 'ERROR detected. Return code was not zero '
	 	echo $retval
		return $retval
	fi
}

check_non_zero_error_code () {
	retval=$?
	if [ $retval > 0 ]; then 
		return 0
	fi

	printf 'ERROR detected. '
	echo $retval
	return $retval

}


echo "--------------------"
echo "backup development"
echo "--------------------"
umount -f /dev/sdc2 
check_non_zero_error_code 

e2fsck /dev/sdc2 -f -y -C 0
check_zero_error_code

e2image -ra -p '/dev/sdc2' '/dev/sdb1'
check_zero_error_code 

tune2fs -L develop-bck /dev/sdb1
check_zero_error_code

tune2fs /dev/sdb1 -U random 

echo "done"


echo "--------------------"
echo "backup shared"
echo "--------------------"
umount /dev/sda9 -f
check_non_zero_error_code 

e2fsck /dev/sda9 -f -y -C 0
check_zero_error_code

e2image -ra -p '/dev/sda9' '/dev/sdb2'
check_zero_error_code

tune2fs -L shared-bck /dev/sdb2
check_zero_error_code

tune2fs /dev/sdb2 -U random 

echo "done"


if [ ! -z $1 ]; then

	echo "--------------------"
	echo "vm "
	echo "--------------------"
	umount /dev/sda8 -f
	check_non_zero_error_code 

	e2fsck /dev/sda8 -f -y -C 0
	check_zero_error_code

	e2image -ra -p '/dev/sda8' '/dev/sdb4'
	check_zero_error_code

	tune2fs -L vm-bck /dev/sdb4
	check_zero_error_code
	tune2fs /dev/sdb4 -U random 
	echo "done"

	echo "--------------------"
	echo "data"
	echo "--------------------"
	umount /dev/sdc5 -f
	check_non_zero_error_code 

	e2fsck /dev/sdc5 -f -y -C 0
	check_zero_error_code

	e2image -ra -p '/dev/sdc5' '/dev/sdb3'
	check_zero_error_code

	tune2fs -L data-bck /dev/sdb3
	check_zero_error_code
	tune2fs /dev/sdb3 -U random 
	echo "done"

fi




