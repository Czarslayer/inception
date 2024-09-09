#!/bin/bash

# Start MariaDB service
mkdir -p /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql
chmod 755 /var/lib/mysql


mariadb-install-db --user=mysql --datadir=/var/lib/mysql


service mariadb start

# Wait for MariaDB to be ready
#  while ! mysqladmin ping -h localhost --silent; do
#     echo "Waiting for MariaDB to be ready..."
#     sleep 5
# done


db_name="walo"
db_user="walo"
db_pass="walo"

# Initialize the database

mariadb -e "CREATE DATABASE IF NOT EXISTS $db_name;"
mariadb -e "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pass';"
mariadb -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

echo "Database initialized"

service mariadb stop

mysqld --bind-address=0.0.0.0