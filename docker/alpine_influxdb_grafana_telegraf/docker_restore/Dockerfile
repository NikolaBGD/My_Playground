FROM alpine:3.7

RUN echo 'hosts: files dns' >> /etc/nsswitch.conf
RUN apk add --no-cache tzdata bash ca-certificates && \ 
    update-ca-certificates

ENV INFLUXDB_VERSION 1.7.1
RUN set -ex && \ 
    apk add --no-cache --virtual .build-deps wget gnupg tar && \ 
    for key in \ 
    05CE15085FC09D18E99EFB22684A14CF2582E0C5 ; \ 
    do \
        gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
	gpg --keyserver pgp.mit.edu --recv-keys "$key" || \
	gpg --keyserver keyserver.pgp.com --recv-keys "$key" ; \
    done && \ 
    wget --no-verbose https://dl.influxdata.com/influxdb/releases/influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz.asc && \
    wget --no-verbose https://dl.influxdata.com/influxdb/releases/influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz && \
    gpg --batch --verify influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz.asc influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz && \
    mkdir -p /usr/src && \     tar -C /usr/src -xzf influxdb-${INFLUXDB_VERSION}-static_linux_amd64.tar.gz && \
    rm -f /usr/src/influxdb-*/influxdb.conf && \ 
    chmod +x /usr/src/influxdb-*/* && \ 
    cp -a /usr/src/influxdb-*/* /usr/bin/ && \ 
    rm -rf *.tar.gz* /usr/src /root/.gnupg && \ 
    apk del .build-deps

COPY influxdb.conf /etc/influxdb/influxdb.conf
COPY backup_influxdb /apps/backup_influxdb


EXPOSE 8086/tcp

VOLUME /var/lib/influxdb

WORKDIR /apps
RUN influxd restore -metadir /var/lib/influxdb/meta backup_influxdb/ && \ 
    influxd restore -datadir /var/lib/influxdb/data -db mydb backup_influxdb/

COPY entrypoint.sh /entrypoint.sh
COPY init-influxdb.sh /init-influxdb.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["influxd"]
