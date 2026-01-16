FROM php:5.5-cli

# Fix Debian Jessie repos (moved to archive)
RUN echo "deb http://archive.debian.org/debian jessie main" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security jessie/updates main" >> /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until

# Install system dependencies
RUN apt-get update && apt-get install -y --force-yes \
    ca-certificates \
    curl \
    unzip \
    git \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install mysql extension (deprecated but available in PHP 5.5)
RUN docker-php-ext-install mysql

# Install mysqli for comparison/future migration
RUN docker-php-ext-install mysqli

# Install additional extensions
RUN docker-php-ext-install pdo pdo_mysql

# Install Composer 2.2 LTS (last version supporting PHP 5.5)
RUN curl -sS https://getcomposer.org/download/2.2.24/composer.phar -o /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

WORKDIR /app

CMD ["php", "-v"]
