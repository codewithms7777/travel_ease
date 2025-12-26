# Use official PHP 8.2 with Apache
FROM php:8.2-apache

# Install MySQL extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql \
    && docker-php-ext-enable mysqli pdo pdo_mysql

# Copy project files to Apache root
COPY . /var/www/html/

# Give Apache user permissions
RUN chown -R www-data:www-data /var/www/html

# Expose HTTP port
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
