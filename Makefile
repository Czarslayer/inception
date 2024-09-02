all: stop build run
# Build the containers and set up the network and volume
build:
	docker build -t mariadb ./mariadb/
	docker build -t wordpress ./wordpress/
	docker build -t nginx ./nginx/
	-docker network create wp_bridge
	-docker volume create wpvolume

# Run the containers
run:
	docker run -d --rm --name marianame  --network wp_bridge mariadb
	docker run -d --rm --name wpname --volume ./volume:/var/www/html --network wp_bridge wordpress
	docker run -d --rm -p 8080:80 --name nginx --volume ./volume:/var/www/html:ro --network wp_bridge nginx

# Stop and remove the containers, network, and volume
stop:
	-docker stop marianame
	-docker stop wpname
	-docker stop nginx
	-docker network rm wp_bridge
	-docker volume rm wpvolume

# Clean up the images
clean:
	-docker rmi mariadb
	-docker rmi wordpress
	-docker rmi nginx

