FROM debian:bookworm

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    php \
    php-mysql \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html && \
    wget -qO /var/www/html/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

EXPOSE 8080

# Start PHP's built-in web server
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]