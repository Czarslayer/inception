all: 
	docker compose -f ./srcs/docker-compose.yml up --build -d

stop:
	docker compose -f ./srcs/docker-compose.yml stop

down:
	docker compose -f ./srcs/docker-compose.yml down


volume:
	-sudo rm -rf /home/mabahani/data/DB/*
	-sudo rm -rf /home/mabahani/data/WordPress/*

restart: down all


imgrmi:
	docker rmi $(shell docker images -q)

vlmrmi:
	docker volume rm $(shell docker volume ls -q)

fclean: stop down volume imgrmi vlmrmi

frestart: stop down imgrmi vlmrmi volume all