#!/bin/bash
echo "extension=php_pdo_mysql.so" >> /etc/php/7.0/fpm/php.ini
sed "s/'localhost'/'34.202.112.233:3306'/g" /var/www/html/simple-website/libs/constants.php
sed 's/root/test/g' /var/www/html/simple-website/libs/constants.php
