FROM php:7.2-apache
RUN apt-get update && apt-get install zip git -y

#RUN pecl install memcached-3.1.5
RUN pecl install xdebug-2.9.0 \
 && docker-php-ext-enable xdebug

RUN cd /tmp \
 && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php --install-dir="/bin" --filename=composer \
 && php -r "unlink('composer-setup.php');"