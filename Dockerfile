FROM php:7.4-apache


RUN apt update && apt install -y git 

WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html

RUN docker-php-ext-install mysqli

# Copies your code to the image
COPY /site /var/www/html

EXPOSE $PORT
#CMD [“apache2ctl”, “-D”, “FOREGROUND”]
ENTRYPOINT apache2ctl -D 'FOREGROUND'



