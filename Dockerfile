FROM debian:bullseye

RUN apt-get update && apt-get upgrade

WORKDIR /var/www/html

COPY script.sh ./script.sh
RUN chmod 777 script.sh
RUN ./script.sh

