FROM alpine:latest

RUN apk update &&apk upgrade

RUN apk add openssh \
	    telegraf

ADD ./deploy.sh /code/deploy.sh

WORKDIR /code

COPY ./influxdb.conf /etc/influxdb/influxdb.conf

COPY ./telegraf.conf /etc/telegraf/telegraf.conf

COPY ./grafana_plugins /code/grafana_plugins

EXPOSE 8086/tcp

EXPOSE 8088/tcp

EXPOSE 3000/tcp 

RUN sh deploy.sh grafana_plugins

ENTRYPOINT ["/bin/sh"]

