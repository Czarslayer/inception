#!/bin/bash

# Update and install dependencies
apt-get update && apt-get install -y \
    curl \
    php-cli \
    less \
    sudo \
    wget \
    unzip \
    git \
    jq

# Download WP-CLI Phar file
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Make the Phar file executable
chmod +x wp-cli.phar

# Move WP-CLI to /usr/local/bin so it's globally accessible
sudo mv wp-cli.phar /usr/local/bin/wp

# Verify WP-CLI installation
if wp --info; then
    echo "WP-CLI installed successfully!"
else
    echo "WP-CLI installation failed!"
    exit 1
fi

# Clean up
apt-get clean && rm -rf /var/lib/apt/lists/*
