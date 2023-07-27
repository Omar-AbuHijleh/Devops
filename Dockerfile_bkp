# Use the official Ubuntu image as the base image
FROM ubuntu:latest

# Install Apache web server and other necessary tools
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the custom index.html file into the Apache document root
COPY index.html /var/www/html/

# Expose port 80 for Apache
# EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
