FROM ubuntu:xenial

RUN apt-get update \
	&& apt-get install -y apt-transport-https

COPY assets/etc/apt/sources.list.d/server-mechanic.list /etc/apt/sources.list.d/
RUN apt-get update && apt-get install -y mechanic \
        && apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/*

COPY assets/etc/mechanic.conf /etc/mechanic.conf
COPY assets/etc/mechanic/ /etc/mechanic/
COPY assets/service /service

VOLUME /srv/mechanic

ENTRYPOINT [ "/usr/sbin/mechanic", "-v", "migrate", "--" ]
CMD [ "/service" ]
