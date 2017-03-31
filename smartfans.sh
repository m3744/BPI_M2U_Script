#!/bin/bash

temp="$(/usr/sbin/smartctl -a /dev/sda |  grep Temperature_Celsius | awk '{print $4}')"


if [ ${temp} -gt 140 ] 
then
        #echo 277 > /sys/class/gpio/export
        #echo out > /sys/class/gpio/gpio277/direction	
	echo 1 >/sys/class/gpio/gpio277/value
        echo "temp ${temp} enable fans"
        sleep 180
else
	#echo 277 > /sys/class/gpio/export 
        #echo out > /sys/class/gpio/gpio277/direction
        echo 0 >/sys/class/gpio/gpio277/value
        echo "temp ${temp} disable fans" 
fi
