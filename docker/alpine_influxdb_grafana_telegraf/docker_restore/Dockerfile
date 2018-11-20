FROM influxdb:1.6.4-alpine

ADD ./conf/influxdb-selfsigned.crt /etc/ssl/influxdb-selfsigned.crt

ADD ./conf/influxdb-selfsigned.key /etc/ssl/influxdb-selfsigned.key

EXPOSE 8086/tcp

EXPOSE 8088/tcp

