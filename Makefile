NAME = 		inception

COMPOSE =	-f ./srcs/docker-compose.yml

DOCKER =	docker compose $(COMPOSE) -p $(NAME)



all:	start

build:
	$(DOCKER) build

start:
	$(DOCKER) up --build # -d

down:
	$(DOCKER) down

clean:
	$(DOCKER) down --volumes
	rm -rf /Users/amuhleth/cursus/inception/data/wordpress/*
	rm -rf /Users/amuhleth/cursus/inception/data/db/*

re:	clean build start


.PHONY:	all build start down clean re
