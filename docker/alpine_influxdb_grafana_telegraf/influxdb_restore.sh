echo Please input the date corresponding to your bakup file\(eg. 20181116\).
read date_1
echo Please input the date corresponding to your bakup file again\(eg. 20181116\).
read date_2
if [ "$date_1" = "$date_2" ] ;then
	if [ -d "/root/backup_influxdb/backup_influxdb_$date_1" ];then
		echo Are you sure to restore "$date_1"\(y/n\)\? \(It will remove the origin. You have to recovery by restore newest backup later.\)
		read answer
		if [ "$answer" = "y" ] || [ "$answer" = "Y" ] || [ "$answer" = "YES" ] || [ "$answer" = "yes" ] || [ "$answer" = "Yes" ] ;then
			service influxdb stop
			rm -rf /var/lib/influxdb/meta
			rm -rf /var/lib/influxdb/data
			influxd restore -metadir /var/lib/influxdb/meta /root/backup_influxdb/backup_influxdb_$date_1
			influxd restore -datadir /var/lib/influxdb/data -db mydb -newdb mydb_$date_1 /root/backup_influxdb/backup_influxdb_$date_1
			chown -R influxdb:influxdb /var/lib/influxdb
			service influxdb start
		else
			echo Process exit!
		fi
	else
		echo There is no backup_influxdb_$date_1
	fi
else
	echo Different date! 
fi

