FROM php:8.2-apache

# Disable extra MPMs
RUN a2dismod mpm_prefork mpm_worker \
    && a2enmod mpm_event

# Enable necessary modules
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy your app
COPY . /var/www/html/

# Set permissions (if needed)
RUN chown -R www-data:www-data /var/www/html

# Expose port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
