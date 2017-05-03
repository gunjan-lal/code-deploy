#!/bin/bash
services='nginx php-fpm'

for service in $services
do
if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 0 ))
	then
		echo "$service is running!!!"
	else echo "$service is not running"; exit 1;
	fi
done

