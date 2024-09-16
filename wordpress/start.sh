#!/bin/bash

echo "Starting WordPress setup..."

sed -i -e 's/.*listen = .*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

cd /var/www/html
while ! mysqladmin ping -h marianame --silent; do
    echo "Waiting for MariaDB to be ready..."
    sleep 5
done

if [ ! -f /var/www/html/wp-config.php ]; then
    wp core download --allow-root

    wp core config --dbname=$db_name --dbuser=$db_user --dbpass=$db_pass --dbhost=$db_host --allow-root --path=/var/www/html

    wp core install --url=$wp_url --title=$wp_title --admin_user=$admin_user --admin_password=$admin_pass --admin_email=$admin_email --allow-root 

    wp user create --allow-root $user $user_mail --user_pass=$user_pass --user_url=$user_url --role=$user_role --allow-root 
fi

mkdir -p /run/php 


echo "finished WordPress setup..."


exec /usr/sbin/php-fpm7.4 -F
