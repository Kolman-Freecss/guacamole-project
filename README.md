# Guacamole project

This is a small documentation how to run a fully working **Apache Guacamole (incubating)** instance with docker (docker-compose). The goal of this project is to make it easy to test Guacamole.

## Getting started

Pull the docker image from docker hub:

```bash
docker pull guacamole/guacamole
docker pull guacamole/guacd
docker pull mariadb/server
```

Create database initialization script:

```bash
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --mysql > /opt/guacamole/mysql/01-initdb.sql
```

Copy the db initialization script to the container.

```bash
docker cp guac_db.sql guacdb:/guac_db.sql
```

Open a shell in the container and execute the script.

```bash
docker exec -it guacdb bash
cat /guac_db.sql | mysql -u root -p guacamole_db
exit
```

At this point you should be able to browse to http://my.docker.ip.address:8080/guacamole and login with guacadmin/guacadmin.

## Troubleshooting

- This project is intended for Linux, so if you are using Windows or Mac, you might have some problems like the next:
  - If you generate the db initialization script on Windows, you will have problems with the line endings. You can fix this by using the `dos2unix` command.
  - Or use the script that is already in the repository.

## References

Ref: https://www.systems.dance/2021/01/apache-guacamole-and-docker-compose/

Ref2: https://www.howtoforge.com/how-to-install-apache-guacamole-as-docker-container-on-ubuntu/