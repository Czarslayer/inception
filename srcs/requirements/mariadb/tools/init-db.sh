#!/bin/bash

echo "Starting MariaDB service---------------------"
service mariadb start
echo "finished MariaDB service---------------------"


mariadb -e "CREATE DATABASE IF NOT EXISTS $db_name;"
mariadb -e "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pass';"
mariadb -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%';"
mariadb -e "FLUSH PRIVILEGES;"


echo "Database initialized"

service mariadb stop

exec mariadbd --bind-address=0.0.0.0