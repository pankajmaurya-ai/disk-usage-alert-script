#!/bin/bash

#Get disk usage for root file system

USAGE=$(df / | awk 'NR=2 {print $5}' | sed 's/%//')

#check if usage is above 80%

if [ $USAGE -gt 30 ]; 
then 
	echo "$(date): Disk usage is above 30% (current: $USAGE% )" >> /var/log/disk_alert.log
else 
	echo "$(date): Disk usage is normal (Current : $USAGE% )"
fi

