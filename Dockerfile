FROM php:alpine

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apk add --update oniguruma-dev freetype-dev libpng-dev libjpeg-turbo-dev libxml2-dev autoconf g++ libtool make

RUN docker-php-ext-configure gd \
        --enable-gd \
        --with-freetype \
        --with-jpeg

RUN docker-php-ext-install mysqli gd pdo_mysql opcache

RUN apk del autoconf g++ libtool make \
    && rm -rf /tmp/* /var/cache/apk/*