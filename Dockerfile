FROM ubuntu 
RUN apt-get update 
RUN apt-get install –y apache2 
RUN apt-get install –y apache2-utils 
EXPOSE $PORT
#CMD [“apache2ctl”, “-D”, “FOREGROUND”]
