all: stop build run
# Build the containers and set up the network and volume
build:
	docker build --no-cache -t mariadb ./mariadb/
	docker build --no-cache -t wordpress ./wordpress/
	docker build --no-cache -t nginx ./nginx/
	# docker build -t mariadb ./mariadb/
	# docker build -t wordpress ./wordpress/
	# docker build -t nginx ./nginx/
	-docker network create wp_bridge
	-docker volume create wpvolume
	-docker volume create dbvolume

# Run the containers
run:
	docker run -d --rm            --name marianame        --volume dbvolume:/var/lib/mysql --network wp_bridge mariadb
	docker run -d --rm            --name wpname           --volume wpvolume:/var/www/html  --network wp_bridge wordpress
	docker run -d --rm -p 443:443 --name nginx            --volume wpvolume:/var/www/html  --network wp_bridge nginx

# Stop and remove the containers, network, and volume
stop:
	-docker stop marianame
	-docker stop wpname
	-docker stop nginx
	-docker network rm wp_bridge
	-docker volume rm wpvolume
	-docker volume rm dbvolume

# Clean up the images
clean:
	-docker rmi mariadb
	-docker rmi wordpress
	-docker rmi nginx

