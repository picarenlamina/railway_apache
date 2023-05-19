FROM ubuntu
RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get install apache2-utils -y
RUN apt-get clean
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN docker-php-ext-install pdo pdo_mysql
EXPOSE $PORT
#CMD [“apache2ctl”, “-D”, “FOREGROUND”]
ENTRYPOINT apache2ctl -D 'FOREGROUND'
