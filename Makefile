include .env
export

# MariadDB
start_mariadb:
	docker run --rm -d -it --name $(MARIADB_CONTAINER) -p $(MARIADB_PORT):3306 -e MARIADB_ROOT_PASSWORD=$(MARIADB_ROOT_PASSWORD) \
		-v ./mysql-data:/var/lib/mysql \
		mariadb:latest && \
		docker run --rm -d -it --name $(PHPMYADMIN_CONTAINER) -p $(PHPMYADMIN_PORT):80 --link $(MARIADB_CONTAINER):db -e MYSQL_ROOT_PASSWORD=$(MARIADB_ROOT_PASSWORD) \
		-v ./phpmyadmin/config.user.inc.php:/etc/phpmyadmin/config.user.inc.php \
		phpmyadmin

stop_mariadb:
	docker stop $(MARIADB_CONTAINER)
	docker stop $(PHPMYADMIN_CONTAINER)

start_phpmyadmin:

# Postgres
start_postgres:
	docker run --rm -d -it --name $(PG_CONTAINER) -p $(PG_PORT):5432 -e POSTGRES_PASSWORD=$(PG_PASSWORD) \
		-e PGDATA=/var/lib/postgresql/data/pgdata \
		-v ./postgres-data:/var/lib/postgresql/data \
		postgres:latest
	mkdir -p ./pgadmin4/var/lib/pgadmin && sudo chown -R 5050:5050 ./pgadmin4/var/lib/pgadmin
	docker run --rm -d -it --name $(PGADMIN_CONTAINER) -p $(PGADMIN_PORT):80 \
		--link $(PG_CONTAINER):pg \
		-e PGADMIN_DEFAULT_EMAIL=$(PGADMIN_DEFAULT_EMAIL) \
		-e PGADMIN_DEFAULT_PASSWORD=$(PGADMIN_DEFAULT_PASSWORD) \
		-v ./pgadmin4/var/lib/pgadmin:/var/lib/pgadmin \
		-v ./pgadmin4/config/servers.json:/pgadmin4/servers.json \
		dpage/pgadmin4:latest

stop_postgres:
	docker stop $(PG_CONTAINER)
	docker stop $(PGADMIN_CONTAINER)

status:
	docker container ls
