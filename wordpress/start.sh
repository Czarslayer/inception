#!/bin/bash
# Download and set up WordPress
cd /var/www/html
sed -i -e 's/.*listen = .*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

while ! mysqladmin ping -h marianame --silent; do
    echo "Waiting for MariaDB to be ready..."
    sleep 5
done

if [ ! -f /var/www/html/wp-config.php ]; then
    wp core download --allow-root

    # Configure WordPress
    wp core config --dbname=walo --dbuser=walo --dbpass=walo --dbhost=marianame:3306 --allow-root

    # Install WordPress
    wp core install --url=localhost --title=Wordpress --admin_user=admin --admin_password=password --admin_email=moradabahni@gmail.com --allow-root

    # create a user
    wp user create --allow-root morad mauradabahani@gmail.com --user_pass=password --user_url=www.moradtest.com --allow-root
fi
# Create PHP runtime directory with correct permissions
mkdir -p /run/php && chown -R www-data:www-data /run/php

# Update PHP-FPM configuration
echo "updated"

# Start PHP-FPM service
exec /usr/sbin/php-fpm7.4 -F
