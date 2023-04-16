include .env
export

# MariadDB
start_mariadb:
	docker run --rm -d --name $(MARIADB_CONTAINER) -p $(MARIADB_PORT):3306 -e MARIADB_ROOT_PASSWORD=$(MARIADB_ROOT_PASSWORD) \
		-v ./mysql-data:/var/lib/mysql \
		mariadb:latest
	docker run --rm -d --name $(PHPMYADMIN_CONTAINER) -p $(PHPMYADMIN_PORT):80 --link $(MARIADB_CONTAINER):db -e MYSQL_ROOT_PASSWORD=$(MARIADB_ROOT_PASSWORD) \
		-v ./phpmyadmin/config.user.inc.php:/etc/phpmyadmin/config.user.inc.php \
		phpmyadmin

stop_mariadb:
	docker stop $(MARIADB_CONTAINER)
	docker stop $(PHPMYADMIN_CONTAINER)

start_phpmyadmin:

# Postgres
start_postgres:
	docker run --rm -d --name $(PG_CONTAINER) -p $(PG_PORT):5432 -e POSTGRES_PASSWORD=$(PG_PASSWORD) \
		-e PGDATA=/var/lib/postgresql/data/pgdata \
		-v ./postgres-data:/var/lib/postgresql/data \
		postgres:latest

stop_postgres:
	docker stop $(PG_CONTAINER)

