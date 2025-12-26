# Use PHP 8.2 with Apache
FROM php:8.2-apache

# Install MySQL extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy your project files
COPY . /var/www/html/

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80
