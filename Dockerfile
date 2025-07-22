FROM php:8.4.10-fpm-alpine3.22

# Set the working directory
WORKDIR /var/www/html

# Install required PHP extensions
RUN apk add --no-cache libzip-dev unzip \
    && docker-php-ext-install pdo pdo_mysql mysqli zip

# Copy Composer from the official image
COPY --from=composer:2.8.10 /usr/bin/composer /usr/local/bin/composer

# Copy project files
COPY . /var/www/html

# Expose the port for PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]
