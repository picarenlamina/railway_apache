FROM php:7.4-apache


RUN apt update && apt install -y git 

WORKDIR /var/www/html


RUN git clone https://github.com/picarenlamina/symfony_blob.git .

RUN chown -R www-data:www-data /var/www/html

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo 
RUN docker-php-ext-install pdo_mysql

#instar composer source: https://www.howtogeek.com/devops/how-to-use-docker-to-containerise-php-and-apache/
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
#COPY composer.json composer.json
#COPY composer.lock composer.lock
RUN composer install --no-dev


# Copies your code to the image
COPY /site /var/www/html



EXPOSE $PORT
#CMD [“apache2ctl”, “-D”, “FOREGROUND”]
ENTRYPOINT apache2ctl -D 'FOREGROUND'



