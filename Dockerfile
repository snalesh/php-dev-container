FROM snalesh/php-base

RUN pecl install xdebug \
 && docker-php-ext-enable xdebug