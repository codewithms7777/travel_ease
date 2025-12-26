FROM php:8.2-apache

# Install MySQL extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql \
    && docker-php-ext-enable mysqli pdo pdo_mysql

# Copy project
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Make sure index.php exists
RUN test -f /var/www/html/index.php || echo "<?php echo 'Index missing'; ?>" > /var/www/html/index.php

# Expose port and run Apache
EXPOSE 80
CMD ["apache2-foreground"]
