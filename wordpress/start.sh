#!/bin/bash
echo "updated"
service php7.4-fpm start
nginx -g 'daemon off;'