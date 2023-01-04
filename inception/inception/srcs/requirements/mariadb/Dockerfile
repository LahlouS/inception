FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server-10.3 -y
RUN apt-get install mariadb-client -y
COPY conf/setup_script.sh /
RUN chmod 755 setup_script.sh

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306
CMD ["/setup_script.sh"]
