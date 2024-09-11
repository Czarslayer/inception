#!/bin/bash

# Start MariaDB service
service mariadb start

# Wait for MariaDB to be ready
#  while ! mysqladmin ping -h localhost --silent; do
#     echo "Waiting for MariaDB to be ready..."
#     sleep 5
# done
# Initialize the database

mariadb -e "CREATE DATABASE IF NOT EXISTS $db_name;"
mariadb -e "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pass';"
mariadb -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

echo "Database initialized"

service mariadb stop

mysqld --bind-address=0.0.0.0