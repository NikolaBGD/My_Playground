#! /bin/sh

distribution = cat /etc/*-release | head -n 1 | cut -d ' ' -f1
version = cat /etc/*-release | head -n 1 | cut -d ' ' -f3 | cut -c 1
if ["$distribution" == "CentOS"] && ["$version" == "7"]; then
	sudo yum remove docker \
		 docker-client \
		 docker-client-latest \
		 docker-common \
		 docker-latest \
		 docker-latest-logrotate \
		 docker-logrotate \
		 docker-selinux \
		 docker-engine-selinux \
		 docker-engine
	sudo yum install -y yum-utils \
		device-mapper-persistent-data \
		lvm2
	sudo yum-config-manager \
		--add-repo \
		https://download.docker.com/linux/centos/docker-ce.repo
	sudo yum install docker-ce
else
	echo goto \"https://docs.docker.com/install/overview/\", pick the corresponding version, and follow the installing step.
fi

