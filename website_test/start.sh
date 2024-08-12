#!/bin/bash

# Start MariaDB
service mysql start

# Initialize the WordPress database
mysql -u root <<-EOSQL
    CREATE DATABASE IF NOT EXISTS wordpress;
    CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY 'password';
    GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'localhost';
    FLUSH PRIVILEGES;
EOSQL

# Start PHP-FPM
service php7.4-fpm start

# Start Nginx
nginx -g 'daemon off;'