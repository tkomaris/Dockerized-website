.PHONY:  all up down fclean

all:
	@sudo service nginx stop
	@sudo service mysql stop
	@sudo echo "127.0.0.1 tkomaris.42.fr" >> /etc/hosts
	@sudo mkdir -p /home/tkomaris/data/wordpress
	@sudo mkdir -p /home/tkomaris/data/mariadb
	@sudo docker compose -f srcs/docker-compose.yml up --build -d

up:
	@sudo docker compose -f srcs/docker-compose.yml up --build -d

down:
	@sudo docker compose -f srcs/docker-compose.yml down

fclean:
	@sudo docker compose -f srcs/docker-compose.yml down --rmi all --volumes
	@sudo rm -rf /home/tkomaris/data


