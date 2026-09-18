NAME = inception
COMPOSE_FILE = ./srcs/docker-compose.yml

all: up

up:
	docker compose -f $(COMPOSE_FILE) up -d --build

down:
	docker compose -f $(COMPOSE_FILE) down

clean: down
	docker compose -f $(COMPOSE_FILE) down -v

fclean: clean
	sudo rm -rf /home/oait-h-m/data/mariadb/*
	sudo rm -rf /home/oait-h-m/data/wordpress/*

re: fclean all

.PHONY: all up down clean fclean re