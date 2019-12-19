#!/bin/bash
/etc/boot_times
echo performance | tee $(find /sys/ -name *governor)
echo 0 > /proc/sys/kernel/hung_task_timeout_secs
pushd /var/www/html
/usr/sbin/mini_httpd -dd /var/www/html -d /var/www/html -c cgi-bin/* -u root
popd
