FROM php:7.4-apache


RUN apt update && apt install -y git 

WORKDIR /var/www/html


RUN git clone https://github.com/picarenlamina/symfony_blob.git .

RUN chown -R www-data:www-data /var/www/html

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo 
RUN docker-php-ext-install pdo_mysql
#instalacion zip 
#source: https://stackoverflow.com/questions/41651145/docker-container-not-able-to-locate-zip-packages


#instar composer 
#source: https://www.howtogeek.com/devops/how-to-use-docker-to-containerise-php-and-apache/
#COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
#COPY composer.json composer.json
#COPY composer.lock composer.lock
#RUN composer install --no-dev

RUN apt-get update && apt-get install -y \
    curl \
    zip \
    unzip

#instalar composer 
#RUN curl -sS https://getcomposer.org/installer 
#RUN php -- --install-dir=/usr/local/bin --filename=composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && chmod +x /usr/bin/composer
RUN php /usr/bin/composer install 

# Copies your code to the image
COPY /site /var/www/html



EXPOSE $PORT
#CMD [“apache2ctl”, “-D”, “FOREGROUND”]

ENTRYPOINT apache2ctl -D 'FOREGROUND'



