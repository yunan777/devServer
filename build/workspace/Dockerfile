FROM php:8.0-cli

WORKDIR /root

RUN apt update && apt install -y nano git zip unzip

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

RUN docker-php-ext-install bcmath mysqli pdo_mysql

RUN pecl install -D 'enable-redis-igbinary="no" enable-redis-lzf="no" enable-redis-zstd="no"' redis && docker-php-ext-enable redis

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" && mv composer.phar /usr/local/bin/composer

ENTRYPOINT [ "/bin/bash" ]