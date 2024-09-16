all: 
	docker compose up --build

down:
	docker compose down

clean:
	docker compose down
	docker system prune -a -f
	sudo rm -rf ./volume/www/*
	sudo rm -rf ./volume/db/*