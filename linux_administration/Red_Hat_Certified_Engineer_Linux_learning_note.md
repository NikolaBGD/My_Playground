# Basic Filesystem Hierarchy Standard(FHS) Directories
---
## Table 1-1

| Directory |Description                         |
| --------- |:---------------------------------:|
| `/`       | The top level directory in the FHS. |
| `/bin`    | Essential command line utilities.  |
| `/boot`   | Startup file, including the Linux kernel. |
| `/dev`    | Hardware and software device. |
| `/etc`    | Most basic configuration files. |
| `/home`   | Home directories for almost every user. |
| `/lib`    | Program libraries for the kernel and various command line utilities |
| `/mnt`    | The mount point for removable media. |
| `/opt`    | Applications such as WordPerfect or StarOffice. |
| `/proc`   | Currently running kernel-related processes. |
| `/root`   | The home directory of the root user. |
| `/sbin`   | System administration commands. |
| `/tmp`    | Temporary files. |
| `/usr`    | Small programs accessible to all users. |
| `/var`    | Variable data, including log files and printer spools. |


# Filesystem Formatting and Checking
---
- `fdisk`
    + 磁碟管理(如分割新區域、列出硬碟區域、刪除硬碟區域)
- `mkfs`
    + 格式化磁碟(可指定檔案系統格式)
- `fsck`
    + 檢查、修復磁碟

# Mounting Partition
---
- `mount -t 檔案格式(eg.vfat) 裝置(eg./dev/fd0) 資料夾(eg./mnt/floppy)`
- `unmount dir` ----卸載，即我們常用的拔除USB裝置，避免裝置損壞。
- `mount -t iso9660 -o loop /home/seal/myiso.iso /mnt/myiso` ----掛載ISO映像檔

# Looking for Files
---
- `find`
    + `find dir(/ or /home) -name file`
- `locate`
    + `locate file` ----使用Red Hat Linux內建的Database搜尋，速度快但缺點是通常一天只更新一次。

# Creating Files
---
- `cp`
- `mv`
- `ln`
    + 即`捷徑`
    + hard link ----一個檔案擁有多個名字
    + symbolic link ----有一個檔案的內容就是連向原檔案的link
    + `ln file2 file1` ----建立硬連結file2
    + `ln -s file2 file1` ----建立軟連結file2

# File Filters
---
- `sort`
- `grep` and `egrep`
- `wc`

# Administrative Commands
---
- `ps`
- `who` and `w`
    + `who` ----Show who is logged on.
    + `w` ----Show who is logged on and what they are doing.

# Wildcards
---
- `*`
- `?`
- `[]`
- 即glob。

# Crontab
---
- `crontab -u username\[optional\] -e`
- `crontab -l`
- format:
  ```
  分 時 日 月 星期 執行指令
  50 * * * * sh /home/robinyang064023/my_shell.sh
  00 00 * * * python /home/robinyang064023/my_python.py
  ```

# Network Tools and Cmmands
---
- `ping`
- `ifconfig`
    + helps you check and configure network adapters.
- `netstat`

# Name Resolution 
---
- `/etc/hosts`
    + host for record local networks
    + `192.168.132.32   linux1.mommabears.com laptop`
- `/etc/resolv.conf`
    + DNS for record other networks and/or the Internet
    + `nameserver   192.168.0.1`
- `/etc/host.conf`
    + This file determines whether it searches though `/etc/hosts` or `DNS` when searching the networks and/or Internet.
- `/etc/nsswitch.conf`
    + This file lookup the specific system database for the service.

# 

