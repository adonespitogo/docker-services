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
source .env
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

To access `PhpMyAdmin`, visit: https://localhost:8080

PhpMyAdmin is automatically started and can be accessed via [http://localhost:8080](http://localhost:8080) by default.

### Postgres Service

To start `postgres` server, type: `make start_postgres`. To stop, use `make stop_postgres`.

The default connection settings are:

```
host      = localhost
username  = postgres
password  = postgrespass
port      = 5432
```

To access `pgadmin4`, visit https://localhost:8081

The default email/password for pgadmin4 is:

```
Email: admin@domain.com
Password: admin
```

Then select the pre-defined server `Servers > Local Server`. When a prompt appears to enter your password, type: `postgrespass`

This will automatically connect you to the running docker postgres server.

## Docker Status

To list all running docker containers:

```
make status
```
