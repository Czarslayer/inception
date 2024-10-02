FROM debian:bullseye

RUN apt-get  update -y && \
    apt-get install -y mariadb-server

COPY ./tools/init-db.sh /usr/local/bin/init-db.sh
RUN chmod +x /usr/local/bin/init-db.sh

EXPOSE 3306

ENTRYPOINT ["sh","/usr/local/bin/init-db.sh"]
