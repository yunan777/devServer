FROM php:8.0-fpm

WORKDIR /root

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN docker-php-ext-install bcmath mysqli pdo_mysql

RUN pecl install -D 'enable-redis-igbinary="no" enable-redis-lzf="no" enable-redis-zstd="no"' redis && docker-php-ext-enable redis
