#!/bin/bash
set -e

mkdir -p /var/www/html
cd /var/www/html

if [ ! -f "wp-config.php" ]; then
    echo "Downloading WordPress..."
    wp core download --allow-root

    echo "Connecting to MariaDB..."
    wp config create --allow-root \
        --dbname=${MYSQL_DATABASE} \
        --dbuser=${MYSQL_USER} \
        --dbpass=${MYSQL_PASSWORD} \
        --dbhost=mariadb:3306

    echo "Installing WordPress..."
    wp core install --allow-root \
        --url=${DOMAIN_NAME} \
        --title="Inception" \
        --admin_user=${WP_ADMIN_USER} \
        --admin_password=${WP_ADMIN_PASS} \
        --admin_email=${WP_ADMIN_EMAIL}

    echo "Creating author user..."
    wp user create --allow-root ${WP_USER} ${WP_EMAIL} --user_pass=${WP_PASS} --role=author

    echo "WordPress installed successfully."
fi

chown -R www-data:www-data /var/www/html

echo "Starting PHP-FPM..."
exec php-fpm8.2 -F