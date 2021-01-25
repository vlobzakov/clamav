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
	apk add clamav-libunrar
	sed -i -e "s/^Example/#Example/" /etc/clamav/freshclam.conf
fi

#update the config file to use correct log-file
if [[ $detect == *"alpine"* ]]; then
	sed -i -e 's@^#UpdateLogFile /var/log/freshclam.log@UpdateLogFile /var/log/clamav/clamav.log@' /etc/clamav/freshclam.conf
	sed -i -e 's@^#LogFileMaxSize 2M@LogFileMaxSize 0@' /etc/clamav/freshclam.conf
else
	sed -i -e 's@^#UpdateLogFile /var/log/freshclam.log@UpdateLogFile /var/log/clamav/clamav.log@' /etc/freshclam.conf
	sed -i -e 's@^#LogFileMaxSize 2M@LogFileMaxSize 0@' /etc/freshclam.conf
fi

mkdir /var/log/clamav
touch /var/log/clamav/clamav.log
chgrp clamupdate /var/log/clamav/clamav.log
chmod 0764 /var/log/clamav/clamav.log

mkdir /opt/clamav_quarantine
chown 700:700 /opt/clamav_quarantine
chmod 0764 /opt/clamav_quarantine
