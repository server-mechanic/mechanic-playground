# Docker container for trying out mechanic

This is an ubuntu:xenial with mechanic preinstalled.

Mechanic state is stored in an external volume mounted into container as /srv/mechanic.

Migrations can be part of the container below /etc/mechanic/migration.d/ or will be collected from the external volume below /srv/mechanic/migration.d.

An initial migration 0001_hello.sh is applied on container startup.

Container entry point is a shell script running in an endless loop printing "service is up" every second.

#### This container is also publicly available from dockerhub.

## Pull from dockerhub

```
docker pull mechanic-playground
```

## Building the container

```
docker build -t mechanic-playground .
```

## Running the container

```
mkdir -p $PWD/srv-mechanic-volume

docker run --rm -t \
	--name mechanic-playground \
	-v $PWD/srv-mechanic-volume:/srv/mechanic \
	mechanic-playground
```

## Running the container with interactive shell

```
mkdir -p $PWD/srv-mechanic-volume

docker run --rm -ti \
	--name mechanic-playground \
	-v $PWD/srv-mechanic-volume:/srv/mechanic \
	mechanic-playground /bin/bash
```



