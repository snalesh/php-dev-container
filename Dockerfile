FROM php:7.2-apache
RUN apt-get update \
 && apt-get -y install zip unzip git zlib1g-dev libmemcached-dev

RUN git clone -b php7 https://github.com/php-memcached-dev/php-memcached /usr/src/php/ext/memcached \
    && docker-php-ext-configure /usr/src/php/ext/memcached \
        --disable-memcached-sasl \
    && docker-php-ext-install /usr/src/php/ext/memcached \
    && rm -rf /usr/src/php/ext/memcached

RUN pecl install xdebug \
 && docker-php-ext-enable xdebug

RUN cd /tmp \
 && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php --install-dir="/bin" --filename=composer \
 && php -r "unlink('composer-setup.php');"