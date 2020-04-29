#!/bin/bash

detect=$(cat /etc/*-release | grep 'ID=')
if [ $detect == *"debian"* ]; then
	sudo apt-get update
	sudo apt-get install clamav
elif [[ $detect == *"ubuntu"* ]]; then
	sudo apt-get update
	sudo apt-get install clamav
elif [[ $detect == *"centos"* ]]; then
    sudo yum install -y epel-release 
    sudo yum install -y clamav 
elif [[ $detect == *"alpine"* ]]; then
	sudo apk add clamav
fi

sudo sed -i -e "s/^Example/#Example/" /etc/freshclam.conf