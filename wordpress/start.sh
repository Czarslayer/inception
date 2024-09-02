#!/bin/bash
# Download and set up WordPress
cd /var/www/html
wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    rm latest.zip && \
    mv wordpress/* . && \
    rmdir wordpress && \
    chown -R www-data:www-data .

# Create PHP runtime directory with correct permissions
mkdir -p /run/php && chown -R www-data:www-data /run/php

# Update PHP-FPM configuration
echo "updated"
sed -i -e 's/.*listen = .*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

# Start PHP-FPM service
exec /usr/sbin/php-fpm7.4 -F
