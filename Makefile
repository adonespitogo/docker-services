include .env
export

# MariadDB
start_mariadb:
	docker compose up -d mariadb phpmyadmin

stop_mariadb:
	docker compose down mariadb phpmyadmin

# Postgres
# -v $(CWD)/pgadmin4/servers.custom.json:/pgadmin4/servers.custom.json \

start_postgres:
	docker compose up -d postgres pgadmin4
	# chown -R 5050:5050 ./pgadmin4 && \
		docker compose up -d postgres pgadmin4

stop_postgres:
	docker compose down postgres pgadmin4

start_mailhog:
	docker run --rm -d --name mailhog -p 8025:8025 -p 1025:1025 mailhog/mailhog

stop_mailhog:
	docker stop mailhog

status:
	docker container ls
