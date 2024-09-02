FROM debian:bullseye-slim

# Install necessary packages
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy configuration files
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose the default HTTP port
EXPOSE 80

# Start services
CMD ["nginx", "-g", "daemon off;"]
