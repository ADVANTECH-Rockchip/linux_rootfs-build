#!/bin/bash

while :
do
  cat /sys/devices/platform/ff130000.i2c/i2c-3/3-0053/iio:device1/als_data
  sleep 1
done 
