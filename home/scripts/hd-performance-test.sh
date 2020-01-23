#!/bin/bash
# https://wiki.ubuntuusers.de/Festplatten-Geschwindigkeitstest/

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

hd=$1

if [ -z $1 ]; then
    echo "missing HARDISK e.g /dev/sda will used."
    hd="/dev/sda"
fi

hdparm -I $hd
read -p "Press [Enter] key to start the HD Test..."


echo ""
echo "------------------"
echo "hdparm Test 1 mit Cache"
echo "------------------"
echo "Der erste Test nutzt nur die Optionen -t ("Perform device read timings") und -T ("Perform cache read timings")"
echo "und liest damit die Lesezeiten sowie die Cache-Lesezeiten aus."

echo "${green}"
hdparm -tT $hd
echo "${reset}"

echo ""
echo "Die erste linie zeigt die lese speed from cache."
echo "Die zweite linie zeigt den lese  speed from buffer."
echo ""

echo "done"
echo "------------------"
echo "hdparm Test 2 ohne Cache"
echo "------------------"
echo "Der zweite Test nutzt ebenfalls die beiden Optionen -t und -T, setzt dazu aber noch die Option"
echo "--direct („Use O_DIRECT to bypass page cache for timings“), was zum direkten Lesen unter Umgehung"
echo "des Page Caches führt. In der Regel nutzt man den zweiten Test, da dieser nur den Datenfluss misst,"
echo "den die SSD erreicht, um bestimmte Daten in zwei respektive drei Sekunden zu lesen."

echo ""
read -p "Press [Enter] key to start the HD Test..."

echo "${green}"
hdparm -tT --direct $hd
echo "${reset}"


echo ""
echo "Dies Festplatte liest in n Sekunden demnach X Megabyte und in n Sekunden X Megabyte, was Datenraten von etwa"
echo "X MB bzw X MB pro Sekunde entspricht."
echo "done"

echo "------------------"
echo "dd Test 3"
echo "------------------"
echo "um dd nutzen zu können, muss die zu überprüfende Partition eingehängt (mount) sein."
echo "Der Vorteil an dd ist, dass es sowohl die Lese- als auch die Schreibgeschwindigkeit des Laufwerkes testen kann."
echo "Mit folgendem Befehl schreibt man eine temporäre Datei auf die Festplatte, um die Schreibgeschwindigkeit zu testen"
echo "Start write test"

read -p "Press [Enter] key to start the HD Test..."
echo "${green}"
dd if=/dev/zero of=tempfile bs=1M count=1024 conv=fdatasync,notrunc
echo "${reset}"


echo "start read test"
echo 3 | sudo tee /proc/sys/vm/drop_caches > null
# Der Cache ist gelöscht; nun folgt der Lesetest:
# Buffer laden

echo ""
echo "Read test from buffer. wird 5 mal aufgerufen"
echo ""
echo "${green}"
dd if=tempfile of=/dev/null bs=1M count=1024
dd if=tempfile of=/dev/null bs=1M count=1024
dd if=tempfile of=/dev/null bs=1M count=1024
dd if=tempfile of=/dev/null bs=1M count=1024
dd if=tempfile of=/dev/null bs=1M count=1024
echo "${reset}"

echo "done"
rm tempfile

echo "test complete."


