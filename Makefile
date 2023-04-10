include .env
export

start_mariadb:
	docker run --rm --detach -p $(MARIADB_PORT):3306 --env MARIADB_ROOT_PASSWORD=$(MARIADB_ROOT_PASSWORD)  mariadb:latest

stop_mariadb:
	docker stop $(MARIADB_CONTAINER)

