echo please input the date\(eg. 20181116\).
read date_1
echo please input the date again\(eg. 20181116\).
read date_2
if [ $date_1 == $date_2 ] ;then
	echo please input the target_server\'s ip address\(eg. 100.41.36.138\).
	read ip_1
	echo please input the target_server\'s ip address again\(eg. 100.41.36.138\).
	read ip_2
	if [ "$ip_1" = "$ip_2" ] ;then
		echo Are you sure to sco backup to $ip_1\(y/n\)\?
		read answer
		if [ "$answer" = "y" ] || [ "$answer" = "Y" ] || [ "$answer" = "YES" ] || [ "$answer" = "yes" ] || [ "$answer" = "Yes" ] ;then
			influxd backup -database mydb -retention autogen -since 2016-02-01T00:00:00Z ./backup_influxdb_$date_1
			scp -r ./backup_influxdb_$date_1 root@$ip_1:/root/backup_influxdb
			echo Completed! Please check the process\'s correctness.
		else
			echo Process exit!
		fi
	else
		echo you input the different ip address.
	fi
else
	echo you input the different date.
fi

