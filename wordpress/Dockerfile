FROM debian:bullseye-slim

# Install necessary packages
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
mariadb-client \
    php7.4 \
    php-fpm \
    php-mysql \
    wget \
    unzip 

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp
# Copy startup script
COPY ./start.sh /start.sh
RUN chmod 777 /start.sh

# copy theme file to container
COPY ./idea-flow.1.6.zip /idea-flow.1.6.zip

# Expose the default HTTP port
EXPOSE 9000

# Start services
CMD ["/start.sh"]