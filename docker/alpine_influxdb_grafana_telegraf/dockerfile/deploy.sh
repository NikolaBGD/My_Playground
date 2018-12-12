# grafana
docker pull grafana/grafana
docker run \ 
    -d --name=grafana \ 
    -p 3000:3000 grafana/grafana \ 
    -v $PWD/grafana.ini:/etc/grafana/grafana.ini \ 
    -e "GF_INSTALL_PLUGINS=grafana-clock-panel" \ 
    -e "GF_INSTALL_PLUGINS=grafana-piechart-panel" \
    -e "GF_INSTALL_PLUGINS=grafana-worldmap-panel" \
    -e "GF_INSTALL_PLUGINS=goshposh-metaqueries-datasource" \
    -v $PWD:/var/lin/grafana
    grafana/grafana --config=/etc/grafana/grafana.ini

# influxdb
docker pull influxdb:1.7.1
docker run \ 
    -d --name=influxdb \ 
    -p 8086:8086 \ 
    -v $PWD:/var/lib/influxdb \ 
    -v $PWD/influxdb.conf:/etc/influxdb/influxdb.conf:ro \ 
    influxdb:1.7.1 -config /etc/influxdb/influxdb.conf


# telegraf
docker pull telegraf:1.9.0
docker run \ 
    -d --name=telegraf \
    --net=influxdb \
    -v $PWD/telegraf.conf:/etc/telegraf/telegraf.conf:ro \ 
    telegraf:1.9.0 

