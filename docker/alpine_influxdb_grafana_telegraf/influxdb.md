# Influxdb
---

## Installation
---

- 安裝influxdb(以下為centos安裝步驟，詳情`https://portal.influxdata.com/downloads`)
    - `wget https://dl.influxdata.com/influxdb/releases/influxdb-1.7.1.x86_64.rpm`
    - `sudo yum localinstall influxdb-1.7.1.x86_64.rpm`

## Configuration
---

- config檔: 主要改`bind address`
    - `/etc/influxdb/influxdb.conf`
- HTTPS 金鑰
    - `/etc/ssl/influxdb-selfsigned.crt`
    - `/etc/ssl/influxdb-selfsigned.key`
- 環境變數
    - `INFLUXDB_CONFIG_PATH=/etc/influxdb/influxdb.conf`
- 檔案持有權
    - `chown -R influxdb:influxdb /var/lib/influxdb`

## Backup & Restore
---

- Backup
    - `influxd backup -database mydb -retention autogen -since 2016-02-01T00:00:00Z $backup_path`
- Restore
    - `influxd restore -metadir /var/lib/influxdb/meta $restore_path`
    - `influxd restore -datadir /var/lib/influxdb/data -db mydb -newdb mydb_$date $restore_path`

## Potential Issue
---

- Restore fail:
    I delete `/var/lib/influxdb/meta` and `/var/lib/influxdb/data`. 
    After that, the problem disappear but it may not be good.
    
