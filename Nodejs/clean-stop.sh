#!/bin/bash
d=$(date +%Y-%m-%d)
w=/var/www
b=/tmp/backup

if [[ ! -d $b ]]; then
    mkdir $b 
fi


if [[ -d $w/nodejs-server-server ]]; then

mv $w/nodejs-server-server $b-${d}	

chown -R ec2-user $w/nodejs-server-server

fi



rm -rf $w/*

