FROM debian:bullseye-slim

# Install necessary packages
RUN apt-get update && apt-get upgrade && apt-get install -y \
    nginx \
    php7.4 \
    php-fpm \
    php-mysql \
    wget \
    unzip

# Download and set up WordPress

# Copy startup script
COPY ./start.sh /start.sh
RUN chmod 777 /start.sh

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    rm latest.zip && \
    mv wordpress/* . && \
    rmdir wordpress && \
    chown -R www-data:www-data .

# Copy configuration files
COPY default.conf /etc/nginx/conf.d/default.conf
# COPY wp-config.php /var/www/html/wp-config.php

# Expose the default HTTP port
EXPOSE 80

# Start services
CMD ["/start.sh"]