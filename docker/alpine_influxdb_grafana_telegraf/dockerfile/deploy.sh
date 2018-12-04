# influxdb
influxd -config /etc/influxdb/influxdb.conf
service start influxdb

# telegraf
service start telegraf

# grafana
plugins = cat grafana_plugins
grafana-cli plugins install $plugins
service start grafana

