# Docker PHPCS

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
