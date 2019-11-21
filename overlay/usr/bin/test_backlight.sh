#!/bin/bash


if [[ $1 == "" ]]; then


for (( c = 1; c<= 255; c++ ))
do
	echo "Brichtness Level :"$c
	echo $c > /sys/devices/platform/backlight/backlight/backlight/brightness
	read -t 5 -i "press any key..."

done
elif [[ $1 == "als" ]]; then
echo "Press ctrl-C to stop ALS/backlight test..."
while true
do 
level=$(cat /sys/devices/platform/ff130000.i2c/i2c-3/3-0053/iio:device1/als_data)
BL=$((level / 40))
if [[ $BL -gt 255 ]]; then 
BL=255
fi

echo "ALS: "$level" Backlight: "$BL

echo $BL > /sys/devices/platform/backlight/backlight/backlight/brightness

sleep 1
done
else
echo $1 > /sys/devices/platform/backlight/backlight/backlight/brightness

fi
