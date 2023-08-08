include .env
export

# MariadDB
start_mariadb:
	docker run --rm -d --name $(MARIADB_CONTAINER) -p $(MARIADB_PORT):3306 \
		-e MARIADB_ROOT_PASSWORD=$(MARIADB_ROOT_PASSWORD) \
		-v mysqldata:/var/lib/mysql \
		mariadb:latest
	docker run --rm -d --name $(PHPMYADMIN_CONTAINER) -p $(PHPMYADMIN_PORT):80 --link $(MARIADB_CONTAINER):db \
		-e MYSQL_ROOT_PASSWORD=$(MARIADB_ROOT_PASSWORD) \
		-v ./phpmyadmin/config.user.inc.php:/etc/phpmyadmin/config.user.inc.php \
		phpmyadmin

stop_mariadb:
	docker stop $(MARIADB_CONTAINER)
	docker stop $(PHPMYADMIN_CONTAINER)

# Postgres
# -v $(CWD)/pgadmin4/servers.custom.json:/pgadmin4/servers.custom.json \

start_postgres:
	docker run --rm -d --name $(PG_CONTAINER) -p $(PG_PORT):5432 \
		-e POSTGRES_PASSWORD=$(PG_PASSWORD) \
		-e POSTGRES_HOST_AUTH_METHOD=$(PG_AUTH_METHOD) \
		-e PGDATA=/var/lib/postgresql/data/pgdata \
		-v pgdata:/var/lib/postgresql/data \
		postgres:latest
	sudo chown -R 5050:5050 ./pgadmin4 && \
		docker run --rm -d --name $(PGADMIN_CONTAINER) -p $(PGADMIN_PORT):$(PGADMIN_PORT) --link $(PG_CONTAINER):pg-server \
		-e 'PGADMIN_LISTEN_PORT=$(PGADMIN_PORT)' \
		-e 'PGADMIN_DEFAULT_EMAIL=$(PGADMIN_EMAIL)' \
    -e 'PGADMIN_DEFAULT_PASSWORD=$(PGADMIN_PASS)' \
    -e 'PGADMIN_CONFIG_ENHANCED_COOKIE_PROTECTION=True' \
    -e 'PGADMIN_CONFIG_LOGIN_BANNER="Authorised users only!"' \
    -e 'PGADMIN_CONFIG_CONSOLE_LOG_LEVEL=10' \
		-v './pgadmin4/servers.json:/pgadmin4/servers.json' \
		-v 'pgadmin4:/var/lib/pgadmin' \
    dpage/pgadmin4

stop_postgres:
	docker stop $(PG_CONTAINER)
	docker stop $(PGADMIN_CONTAINER)

status:
	docker container ls
