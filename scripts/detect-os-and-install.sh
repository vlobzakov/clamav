#!/bin/bash

detect=$(cat /etc/*-release | grep 'ID=')
if [[ $detect == *"debian"* ]]; then
  export DEBIAN_FRONTEND=noninteractive
	apt-get update
	apt-get --assume-yes install clamav
	sed -i -e "s/^Example/#Example/" /etc/freshclam.conf
elif [[ $detect == *"ubuntu"* ]]; then
  export DEBIAN_FRONTEND=noninteractive
	apt-get update
	apt-get --assume-yes install clamav
	sed -i -e "s/^Example/#Example/" /etc/freshclam.conf
elif [[ $detect == *"centos"* ]]; then
    yum install -y epel-release 
    yum install -y clamav 
    sed -i -e "s/^Example/#Example/" /etc/freshclam.conf
elif [[ $detect == *"alpine"* ]]; then
	apk add clamav
	sed -i -e "s/^Example/#Example/" /etc/clamav/freshclam.conf
fi

freshclam
mkdir /var/log/clamav
touch /var/log/clamav/clamav.log
chgrp clamupdate /var/log/clamav/clamav.log
chmod 1755 /var/log/clamav/clamav.log
