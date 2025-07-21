FROM php:8.4.10-fpm-alpine3.22

# Definir o diretório de trabalho
WORKDIR /var/www/html

# Instalar extensões necessárias
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Copiar o Composer da imagem oficial
COPY --from=composer:2.8.10 /usr/bin/composer /usr/local/bin/composer

# Copiar os arquivos do projeto
COPY . /var/www/html

# Expor a porta para PHP-FPM
EXPOSE 9000

# Iniciar PHP-FPM
CMD ["php-fpm"]