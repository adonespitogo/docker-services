# docker-services

Docker containers for common system services like databases.

I work on multiple enviroments like Mac OS and a variaty of linux operating systems. One common services I need to install in my local development machine are databases for our
applications such as our [AdoPiSoft](https://wwww.adopisoft.com) application and servers. Docker has made it so much easier to setup all these services with
a single configuration repository.

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


## Starting Services

To start any service, use `make start_` + name of the service command. For example, to start `mariadb` server:

```
make start_mariadb
```

To stop `mariadb` server:

```
make stop_mariadb
```

The list of available services are:

- `mariadb`
- `postgres`

## MariaDB Service

The default database access settings are:

```
host      = localhost
username  = root
password  = rootpass
port      = 3306
```

## Postgres Service

The default database access settings are:

```
host      = localhost
username  = postgres
password  = postgrespass
port      = 5432
```

