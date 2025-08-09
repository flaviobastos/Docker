FROM php:8.4.10-fpm-alpine3.22

# Set the working directory
WORKDIR /var/www/html

# Install required PHP extensions with GD (support for PNG and JPEG)
RUN apk add --no-cache libzip-dev unzip \
    libpng-dev libjpeg-turbo-dev freetype-dev \
 && docker-php-ext-configure gd \
    --with-jpeg \
    --with-freetype \
 && docker-php-ext-install \
    pdo \
    pdo_mysql \
    mysqli \
    zip \
    gd \
    exif \
 && echo "upload_max_filesize=10M" > /usr/local/etc/php/conf.d/uploads.ini \
 && echo "post_max_size=200M" >> /usr/local/etc/php/conf.d/uploads.ini \
 && echo "memory_limit=1024M" > /usr/local/etc/php/conf.d/memory.ini

# Copy Composer from the official image
COPY --from=composer:2.8.10 /usr/bin/composer /usr/local/bin/composer

