#!/bin/bash
/etc/boot_times
echo performance | tee $(find /sys/ -name *governor)
echo 0 > /proc/sys/kernel/hung_task_timeout_secs
