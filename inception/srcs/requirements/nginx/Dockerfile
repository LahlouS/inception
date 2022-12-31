FROM debian:buster

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install nginx -y
RUN apt-get install curl -y
RUN mkdir -p /etc/nginx/ssl
# the above line creat dir to receive de TLS certificate for https connexion
RUN apt-get install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=slahlou.42.fr/UID=slahlou"
RUN mkdir -p /var/run/nginx
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY imageTest /data/image/imageTest

CMD [ "nginx", "-g", "daemon off;" ]
