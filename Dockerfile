FROM alpine

RUN apk add --no-cache \
  curl \
  git \
  php8 \
  php8-cli \
  php8-zip \
  php8-openssl \
  php8-mbstring \
  php8-phar \
  php8-tokenizer \
  php8-xmlwriter \
  php8-simplexml \
  && ln -s /usr/bin/php8 /usr/bin/php \
  && curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/bin --filename=composer \
    && composer global require "dealerdirect/phpcodesniffer-composer-installer=*" \
    && composer global require "squizlabs/php_codesniffer=*" \
    && composer global require "drupal/coder=*" \
    && composer global require "phpcompatibility/php-compatibility=*"

ENV PATH "$PATH:/root/.composer/vendor/bin"

WORKDIR "/opt/app"

ENTRYPOINT ["phpcs"]
