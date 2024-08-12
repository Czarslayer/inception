#!/bin/bash

# Start PHP-FPM
service php7.4-fpm start

# Start Nginx
nginx -g 'daemon off;'