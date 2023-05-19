# Tells the image to use the latest version of apache
FROM httpd:2.4

# Creates a directory called "app"
RUN mkdir /app  

# Sets that directory as your working directory
#WORKDIR /app  

# Changes uid and gid of apache to docker user uid/gid
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

# Sets Apache to run via the app directory
#RUN sed -i -e "s/var\/www/app/g" /etc/apache2/apache2.conf && sed -i -e "s/html/public/g" /etc/apache2/apache2.conf

# Copies your code to the image
COPY /site /var/www/site

# Sets permissions for the web user
#RUN chown -R www-data:www-data



EXPOSE $PORT
#CMD [“apache2ctl”, “-D”, “FOREGROUND”]
ENTRYPOINT apache2ctl -D 'FOREGROUND'



