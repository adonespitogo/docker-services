include .env
export

# Start MariadDB
start_mariadb:
	docker run --rm --detach --name $(MARIADB_CONTAINER) -p $(MARIADB_PORT):3306 --env MARIADB_ROOT_PASSWORD=$(MARIADB_ROOT_PASSWORD)  mariadb:latest

stop_mariadb:
	docker stop $(MARIADB_CONTAINER)

# Start Postgres
start_postgres:
	docker run --rm --detach --name $(PG_CONTAINER) -p $(PG_PORT):5432 -e POSTGRES_PASSWORD=$(PG_PASSWORD) postgres:latest

stop_postgres:
	docker stop $(PG_CONTAINER)

