# Use the official FrankenPHP image
FROM dunglas/frankenphp:latest

# Railway uses the /app directory by default
WORKDIR /app

# Install the mysqli extension using the built-in helper
RUN install-php-extensions mysqli

# Copy all your project files into the container
COPY . .

# FrankenPHP listens on port 80 by default, Railway will map this
EXPOSE 80

# This forces FrankenPHP to run on port 80 without SSL
CMD ["frankenphp", "php-server", "--listen", ":80"]
