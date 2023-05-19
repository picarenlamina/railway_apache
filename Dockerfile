FROM ubuntu
RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get install apache2-utils -y
RUN apt-get clean
EXPOSE $PORT
#CMD [“apache2ctl”, “-D”, “FOREGROUND”]
ENTRYPOINT apache2ctl -D 'FOREGROUND'
