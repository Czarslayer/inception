
FROM debian:bullseye

# Install MariaDB
RUN apt-get  update -y && \
    apt-get install -y mariadb-server

# Copy the initialization script
COPY ./tools/init-db.sh /usr/local/bin/init-db.sh
RUN chmod +x /usr/local/bin/init-db.sh

# Expose the default MariaDB port
EXPOSE 3306

# Start MariaDB using the init-db.sh script
ENTRYPOINT ["sh","/usr/local/bin/init-db.sh"]
