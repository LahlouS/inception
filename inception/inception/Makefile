all : build

build :
	sudo docker-compose -f ./srcs/docker-compose.yml build \
	&& sudo docker-compose -f ./srcs/docker-compose.yml up -d


down :
	sudo docker-compose -f ./srcs/docker-compose.yml down

clean :
	make down \
	&& sudo docker system prune -a \
	&& sudo docker volume rm srcs_mariadb srcs_wordpress

re : down clean build

.PHONY : build down re rmi
