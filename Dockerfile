FROM php:5.6-alpine

RUN apk update \
  && apk add git

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV SYMFONY_ENV=prod
ENV COMPOSER_MEMORY_LIMIT=-1
# install Composer globally
#RUN curl -sS https://getcomposer.org/installer | php \
#  && mv composer.phar /usr/local/bin/composer

COPY ./composer-installer.sh /tmp
RUN cd /tmp && chmod 777 composer-installer.sh && ./composer-installer.sh

RUN composer --version

# Memory Limit
RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini
# Time Zone
RUN echo "date.timezone=${PHP_TIMEZONE:-UTC}" > $PHP_INI_DIR/conf.d/date_timezone.ini
