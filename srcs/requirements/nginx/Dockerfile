# Nginx Dockerfile
FROM debian:bullseye

# Install necessary packages
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

# Generate SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx-selfsigned.key \
    -out /etc/nginx/ssl/nginx-selfsigned.crt \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=mabahani.42.fr"

# Copy configuration files
COPY ./tools/default.conf /etc/nginx/conf.d/default.conf

# Expose the default HTTPS port
EXPOSE 443

# Start services
CMD ["nginx", "-g", "daemon off;"]
