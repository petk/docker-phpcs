FROM alpine

RUN apk add --no-cache \
    curl \
    git \
    php82 \
    php82-zip \
    php82-openssl \
    php82-mbstring \
    php82-phar \
    php82-tokenizer \
    php82-xmlwriter \
    php82-simplexml \
    && ln -s /usr/bin/php82 /usr/bin/php \
    && echo "memory_limit = -1" >> /etc/php82/php.ini \
    && curl -sS https://getcomposer.org/installer | php -- \
        --install-dir=/usr/bin --filename=composer \
    && composer global config --no-plugins allow-plugins.dealerdirect/phpcodesniffer-composer-installer true \
    && composer global require -n "dealerdirect/phpcodesniffer-composer-installer=*" \
    && composer global require -n "squizlabs/php_codesniffer=*" \
    && composer global require -n "drupal/coder=*" \
    && composer global require -n "phpcompatibility/php-compatibility=*"

ENV PATH "$PATH:/root/.composer/vendor/bin"

WORKDIR "/opt/app"

ENTRYPOINT ["phpcs", "-p", "--colors", "--standard=PHPCompatibility"]
