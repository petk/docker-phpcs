# Docker PHPCS

![Test workflow](https://github.com/petk/docker-phpcs/actions/workflows/tests.yaml/badge.svg)

Docker image with [phpcs](https://github.com/squizlabs/PHP_CodeSniffer).

## Usage

Build Docker image:

```sh
make build
```

Use it:

```sh
docker run -it --rm -v `pwd`:/opt/app/ petk/phpcs .
```
