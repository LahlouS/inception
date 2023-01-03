FROM debian:buster

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install wget -y
RUN apt-get install -y php7.3\
						php-fpm\
						php-mysql\
						mariadb-client
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/auto_config.sh ./

RUN chmod +x ./auto_config.sh

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

ENTRYPOINT ["./auto_config.sh"]
