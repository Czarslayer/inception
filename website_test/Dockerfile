FROM debian:bullseye-slim

# Install necessary packages
RUN apt-get update && apt-get install -y \
    nginx \
    php7.4 \
    php-fpm \
    php-mysql \
    mariadb-server \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Download and set up WordPress
WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    rm latest.zip && \
    mv wordpress/* . && \
    rmdir wordpress && \
    chown -R www-data:www-data .

# Copy configuration files
COPY default.conf /etc/nginx/sites-available/default
COPY wp-config.php /var/www/html/wp-config.php
COPY my.cnf /etc/mysql/my.cnf

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose the default HTTP port
EXPOSE 80

# Start services
CMD ["/start.sh"]