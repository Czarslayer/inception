all: 
	docker compose -f ./srcs/docker-compose.yml up --build

down:
	docker compose -f ./srcs/docker-compose.yml down

clean:
	docker compose -f ./srcs/docker-compose.yml down
	docker system prune -a -f
	sudo rm -rf /home/mabahani/data/DB/*
	sudo rm -rf /home/mabahani/data/WordPress/*