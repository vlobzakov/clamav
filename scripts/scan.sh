#!/bin/bash

date=$(date)

echo "-------------------------------------------------------------------------------" >> /var/log/clamav/clamav.log
echo "" >> /var/log/clamav/clamav.log
echo "This following Scan has been started at" $date >> /var/log/clamav/clamav.log
echo "" >> /var/log/clamav/clamav.log
echo "-------------------------------------------------------------------------------" >> /var/log/clamav/clamav.log
freshclam
clamscan --infected --recursive --remove --exclude-dir="^/sys" --exclude-dir="^/dev" --exclude-dir="^/proc" -l /var/log/clamav/clamav.log / > /dev/null 2>&1 &