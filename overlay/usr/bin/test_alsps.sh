#!/bin/bash

while :
do
  echo "ALS: "`cat /sys/devices/platform/ff130000.i2c/i2c-3/3-003b/iio:device1/in_illuminance_raw`
  echo "PS : "` cat  /sys/devices/platform/ff130000.i2c/i2c-3/3-003b/iio:device1/in_proximity_raw`
  sleep 1
done 
