FROM php:7-apache-buster
MAINTAINER Rotimi opraise139@gmail.com

RUN docker-php-ext-install mysqli
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf
COPY start-apache /usr/local/bin
RUN a2enmod rewrite

# Copy application source
COPY html /var/www
RUN chown -R www-data:www-data /var/www

CMD ["start-apache"]

## -- Instructions for Dockerfile --
# 1. Pull php:7-apache from dockerhub
# 2. run command docker-php-ext-install mysqli
# 3. copy apache-config.conf from local system to container
# 4. copy start-apache file to the /usr/local/bin folder
# 5. run command a2enmod rewrite
# 6. copy html folder into the /var/www directory in the container
# 7. run command chown -R www-data:www-data /var/www
# 8. start the app by running CMD ["start-apache"]

