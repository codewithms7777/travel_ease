# Use official PHP 8.2 with Apache
FROM php:8.2-apache

# Install PHP MySQL extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql \
    && docker-php-ext-enable mysqli pdo pdo_mysql


# Copy project files
COPY . /var/www/html/

# Set permissions for Apache
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Ensure Apache runs in foreground
CMD ["apache2-foreground"]

# Expose HTTP port
EXPOSE 80
