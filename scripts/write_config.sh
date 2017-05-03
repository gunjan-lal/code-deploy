#!/bin/bash
echo "extension=php_pdo_mysql.so" >> /etc/php/7.0/fpm/php.ini
sed -i "s/'localhost'/'34.202.112.233:3306'/g" /opt/simple-website/libs/constants.php
sed -i 's/root/test/g' /opt/simple-website/libs/constants.php

rsync -azvrh /opt/simple-website/ /var/www/html/

if [ $? != 0 ]
then
	echo "docroot rync failed"
	exit 1
fi

rsync -azrvh /opt/default_nginx_conf/default /etc/nginx/sites-enabled/default

if [ $? != 0 ]
then
        echo "nginx default rync failed"
	exit 1
fi

