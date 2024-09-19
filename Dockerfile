FROM ubuntu:18.04

# Install dependencies
RUN apt-get update && \
    apt-get -y install apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy html file to apache directory
COPY src/ /var/www/html/

# Configure apache
RUN mkdir -p /var/run/apache2 /var/lock/apache2

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]