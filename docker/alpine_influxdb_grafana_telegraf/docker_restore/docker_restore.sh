echo Please input the date corresponding to your bakup file\(eg. 20181116\).
read date_1
echo Please input the date corresponding to your bakup file again\(eg. 20181116\).
read date_2
if [ "$date_1" = "$date_2" ] ;then
	#docker run --rm\
		#       -v ./backup_influxdb_$date_1:/root/influxdb_backup \
		#       -v ./volumns/backup_influxdb_$date_1:/var/lib/influxdb \
		#       -p 8086:8086 \
		#       influxdb -config /etc/influxdb/influxdb.conf \
		#       -c "influxd restore -metadir /var/lib/influxdb/meta /root/influxdb_backup -datadir /var/lib/influxdb/data -db mydb /root/influxdb_backup"
	#       --name backup_influxdb 
	#sleep(3)
	#CONTAINER_ID=`docker ps | grep backup_influxdb | cut –c 1-12` 
	#docker exec "$CONTAINER_ID" influxd restore -metadir /var/lib/influxdb/meta /root/influxdb_backup
	#docker exec "$CONTAINER_ID" influxd restore -datadir /var/lib/influxdb/data -db mydb -newdb mydb_ /root/influxdb_backup
	#docker stop "$CONTAINER_ID"
	docker run --rm \
		-v ./volumns/backup_influxdb_$date_1:/var/lib/influxdb \
		-v ./backup_influxdb_$date_1:/root/influxdb_backup \
		influxdb:1.6.4-alpine \
		-c "influxd restore -metadir /var/lib/influxdb/meta /root/influxdb_backup -datadir /var/lib/influxdb/data -db mydb /root/influxdb_backup"
	docker run \
		--detach \
		-v ./volumns/backup_influxdb_$date_1:/var/lib/influxdb \
		-v ./backup_influxdb_$date_1:/root/influxdb_backup \
		-v ./conf/influxdb.conf:/etc/influxdb/influxdb.conf \
		-p 8086:8086 \
		--name backup_influxdb \
		influxdb:1.6.4-alpine -config /etc/influxdb/influxdb.conf
else
	echo You input the different date.
fi

