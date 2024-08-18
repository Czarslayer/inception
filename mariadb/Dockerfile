FROM debian:bullseye

# Install MariaDB
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Create the necessary directory for MariaDB
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

# Copy the initialization script
COPY init-db.sh /usr/local/bin/init-db.sh
RUN chmod +x /usr/local/bin/init-db.sh

# Expose the default MariaDB port
EXPOSE 3306

# Start MariaDB using the init-db.sh script
CMD ["sh","/usr/local/bin/init-db.sh"]