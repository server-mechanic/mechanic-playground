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

## License

Copyright (c) 2016, 2017 by the [Server Mechanic Team](https://github.com/orgs/server-mechanic/people).

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a [copy of the GNU General Public License](license)
along with this program.  If not, see [GNU GPL v3 at http://www.gnu.org](http://www.gnu.org/licenses/gpl-3.0.txt).
