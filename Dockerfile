FROM php:7.4-apache


RUN apt update && apt install -y git 

WORKDIR /var/www/html


RUN git clone https://github.com/picarenlamina/symfony_blob.git .

RUN chown -R www-data:www-data /var/www/html

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo 
RUN docker-php-ext-install pdo_mysql

RUN apt-get update && apt-get install -y \
    curl \
    zip \
    unzip


#instalar composer 
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && chmod +x /usr/bin/composer

RUN php /usr/bin/composer install 



#RUN  composer require symfony/apache-pack

# Copies your code to the image
COPY /apache/apache2.conf /etc/apache2

# Copies your code to the image
COPY /site /var/www/html


EXPOSE $PORT
#CMD [“apache2ctl”, “-D”, “FOREGROUND”]


ENTRYPOINT apache2ctl -D 'FOREGROUND'






