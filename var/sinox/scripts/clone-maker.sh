#!/bin/bash
# Version 1.1

mode=0
source_dev=""
target_dev=""
errors=0
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
create_date=$(date +%y%m%d)

if [ $(id -u) != 0 ]; then
    echo "this script must be run using sudo"
    echo ""
    exit 1
fi

if [ -z $1 ]; then
   echo "ERROR: first parameter can not be empty  restore or backup "
   exit
fi


if [[ ! $1  =~ ^(backup|restore)$ ]]; then
   echo "ERROR:first parameter must be restore or backup"
   exit
  else

  mode=$1
fi

if [ -z $2 ]; then
   echo "ERROR:source parameter must be a device"
   exit
fi


if [ -z $3 ]; then
   echo "ERROR:target parameter must be a device"
   exit
fi

function help()
{

echo "--------------------------------"
echo "sinox partition backup & restore"
echo "--------------------------------"
echo "help:"
echo "backup parameters: type source target"
echo ${green}"backup /dev/sda1 /dev/sdb6"${reset}
echo "copy partion /dev/sda1 to /dev/sdb6"
echo "The /dev/sdb6 UUID will change."
echo " "
echo "restore parameters: type source target"
echo ${green}"restore /dev/sda6 /dev/sdb1"${reset}
echo "copy partion /dev/sda6 to /dev/sdb1"
echo "The /dev/sdb1 UUID will not change."
}

help


source_dev=$2
target_dev=$3

echo "-------------------------------------------------------------------------------------------"
part_source=${source_dev:5:5}
part_target=${target_dev:5:5}

echo "source:"
lsblk -o name,mountpoint,label,size,uuid | grep "$part_source"
echo "target:"
lsblk -o name,mountpoint,label,size,uuid | grep "$part_target"

if [  -z $4 ]; then
echo "Please review you parameters:"
info_message=$mode" "$source_dev" "$target_dev
echo $info_message;

read -p "Press ENTER to continue. Ctrl-c to cancel."
fi


function assert_is_non_zero()
{
    retval=$?
    if [ $retval -ne 0 ]; then
        echo "ERROR: Return code non 0. OPERATION ABORTED. code="$retval
        errors+=1
        exit
    fi
}

function e2fsck_check_error_code () {
    retval=$?
    if [ $retval -ne 0 ]; then

     case "$retval" in
        "1")
        echo "EXIT CODE:"$retval" - File system errors corrected."

        ;;

        "2" )
        echo "EXIT CODE:"$retval" - File system errors corrected, system should be rebooted."
        ;;

        "4" )
        echo "CRITICAL:"$retval" - File system errors left uncorrected."
        errors+=1
        ;;

        "8" )
        echo "ERROR:"$retval" - Operational error."
        errors+=1
        exit
        ;;

        "16" )
        echo "ERROR:"$retval" - Usage or syntax error."
        errors+=1
        exit
        ;;

        *)
        echo "ERROR:"$retval" - E2fsck canceled by user request or Shared library error."
        errors+=1
        exit
        ;;
    esac

        return $retval

    fi
}

function is_dev_mount()
{
    local mounted=$(cat /proc/mounts | grep $1)
    if [ ! -z "$mounted" ]; then
        echo "${red}"
        echo $1" is mounted. OPERATION ABORTED!!!"${reset}
        errors+=1

        return 1
    fi

}

function restore()
{

    echo ${green}
    echo " "
    echo "----------------------------------------------------"
    echo "-->RESTORE "$label" "$source_dev" to "$target_dev;
    echo "----------------------------------------------------"
    echo ${reset}

    umount $source_dev
    is_dev_mount $source_dev
    result=$?

    if [ $result -ne 0 ]; then
        exit
    fi


    umount $target_dev
    is_dev_mount $target_dev
    result=$?

    if [ $result -ne 0 ]; then
        exit
    fi


    label=$(tune2fs -l $target_dev | grep -i "Filesystem volume name:" |  cut -d':' -f2)
    label=`echo $label | sed -e 's/^[[:space:]]*//'`
    echo $label


    # read target uuid
    target_uuid=$(tune2fs -l $target_dev | grep -i "Filesystem UUID:" |  cut -d':' -f2)
    target_uuid=`echo $target_uuid | sed -e 's/^[[:space:]]*//'`
    echo  "target UUID="$target_uuid

    e2fsck -f -y -v -C 0 $target_dev
    e2fsck_check_error_code

    e2image -ra -p $source_dev $target_dev
    result=$?
    if [ $result -ne 0 ]; then
        tune2fs $2 -U $target_uuid
        exit
    fi



    e2fsck -f -y -v -C 0 $target_dev
    e2fsck_check_error_code

    tune2fs $2 -U $target_uuid
    tune2fs -L "$label" "$target_dev"

    e2fsck -f -y  -C 0 $target_dev
    echo "done"

}

function backup()
{
    echo ${green}
    echo " "
    echo "----------------------------------------------------"
    echo "-->BACKUP "$label" "$source_dev" to "$target_dev;
    echo "----------------------------------------------------"
    echo ${reset}

    umount $source_dev
    is_dev_mount $source_dev
    result=$?

    if [ $result -ne 0 ]; then
        exit
    fi


    umount $target_dev
    is_dev_mount $target_dev
    result=$?

    if [ $result -ne 0 ]; then
        exit
    fi


    echo "-->copy partition  "$source_dev" to "$target_dev
    e2fsck -f -y -v -C 0 $target_dev
    e2fsck_check_error_code

    label=$(tune2fs -l $source_dev | grep -i "Filesystem volume name:" |  cut -d':' -f2)
    label=`echo $label | sed -e 's/^[[:space:]]*//'`
    label+="-"$create_date
    echo $label

    # read current uuid
    current_uuid=$(tune2fs -l $target_dev | grep -i "Filesystem UUID:" |  cut -d':' -f2)
    current_uuid=`echo $current_uuid | sed -e 's/^[[:space:]]*//'
    `
    e2image -ra -p $source_dev $target_dev
    result=$?
    if [ $result -ne 0 ]; then
        tune2fs $2 -U $current_uuid
        exit
    fi


    e2fsck -f -y -v -C 0 $target_dev
    tune2fs -L $label $target_dev
    assert_is_non_zero
    tune2fs $target_dev -U random
    assert_is_non_zero

    # read current uuid
    current_uuid=$(tune2fs -l $target_dev | grep -i "Filesystem UUID:" |  cut -d':' -f2)
    current_uuid=`echo $current_uuid | sed -e 's/^[[:space:]]*//'`
    echo "NEW UUID="$current_uuid
    echo "done"

}

if [ $1 = "backup" ]; then

    backup $source_dev $target_dev
    else
    restore $source_dev $target_dev

fi

# https://stackoverflow.com/questions/4946785/how-to-find-the-difference-in-days-between-two-dates
# echo $(( ($(date --date="200212" +%s) - $(date --date="200211" +%s) )/(60*60*24) ))

echo "complete. Errors="$errors
#--eof--
