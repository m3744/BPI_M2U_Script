#!/bin/bash

temp="$(/usr/sbin/hddtemp /dev/sda  | /usr/bin/awk -F" " '{print substr($4, 1,2)}')"


if [ ${temp} -gt 40 ] 
then
        #echo 277 > /sys/class/gpio/export
        #echo out > /sys/class/gpio/gpio277/direction	
	echo 1 >/sys/class/gpio/gpio277/value
        echo "temp ${temp} enable fans"
        sleep 280 
else
	#echo 277 > /sys/class/gpio/export 
        #echo out > /sys/class/gpio/gpio277/direction
        echo 0 >/sys/class/gpio/gpio277/value
        echo "temp ${temp} disable fans" 
fi
