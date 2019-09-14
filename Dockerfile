FROM php:5.6-alpine

RUN apk update \
  && apk add git

ENV COMPOSER_VERSION=1.6.5
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV SYMFONY_ENV=prod
ENV COMPOSER_MEMORY_LIMIT=-1

COPY ./composer-installer.sh /tmp
RUN cd /tmp && chmod 777 composer-installer.sh && ./composer-installer.sh $COMPOSER_VERSION

RUN composer --version

# Memory Limit
RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini
# Time Zone
RUN echo "date.timezone=${PHP_TIMEZONE:-UTC}" > $PHP_INI_DIR/conf.d/date_timezone.ini
