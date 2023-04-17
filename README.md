# docker-services

Docker containers for common system services like databases.

I work on multiple enviroments like Mac OS and a variaty of linux operating systems. One of the common services I need to install in my local development machine are databases for our
applications such as our [AdoPiSoft](https://wwww.adopisoft.com) application and servers. Docker has made it so much easier to setup all these services for any system with this repository.

## System Requirements

- `docker`
- `make`

## Usage

```
git clone git@github.com:adonespitogo/docker-services.git ~/docker-services
cd ~/docker-services
cp .env.sample .env
```

Setup your environment variables by copying `.env.sample` to `.env` and modify the values in `.env` to suite your needs.

### MariaDB Service

To start `mariadb` server, type: `make start_mariadb`. To stop, use `make stop_mariadb`.

The default connection settings are:

```
host      = localhost
username  = root
password  = rootpass
port      = 3306
```

PhpMyAdmin is automatically started and can be accessed via [http://localhost:8080](http://localhost:8080) by default.

### Postgres Service

**Configuring Pgadmin4**

Copy the [servers.json.sample](./pgadmin4/servers.json.sample) file to `pgadmin4/servers.json` and configure it to match your postgres container settings:

```
cp ./pgadmin4/servers.json.sample ./pgadmin4/config/servers.json
```

The default settings for `pgadmin4` are:

Access: [http://localhost:8081](http://localhost:8081)

```
email       = admin@pgadmin4.local
password    = pgadmin4
```

The `pgadmin4` container is started automatically when you start the postgres container using `make start_postgres` and is stopped automatically when you stop the postgres container via `make stop_postgres`.

To start `postgres` server, type: `make start_postgres`. To stop, use `make stop_postgres`.

The default connection settings are:

```
host      = localhost
username  = postgres
password  = postgres
port      = 5432
```

## Docker Status

To list all running docker containers:

```
make status
```

