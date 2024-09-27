FROM debian:bullseye


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

COPY ./tools/start.sh /start.sh
RUN chmod 777 /start.sh


EXPOSE 9000


CMD ["/start.sh"]