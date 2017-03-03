# Docker container for trying out mechanic

This is an ubuntu:xenial with a dummy service and mechanic preinstalled.

Mechanic state is stored in an external volume mounted into container as /srv/mechanic.

Migrations are part of the container below /etc/mechanic/migration.d/. Migrations from the external volume must be placed below /srv/mechanic/migration.d.

An initial migration 0001_hello.sh is applied on container startup.


#### This container is also publicly available from dockerhub.

## Pull from dockerhub

```
docker pull servermechanic/mechanic-playground
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



