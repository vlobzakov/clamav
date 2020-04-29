#!/bin/bash

detect=$(cat /etc/*-release | grep 'ID=')
if [[ $detect == *"debian"* ]]; then
	sudo apt-get update
	sudo apt-get install clamav
	sudo sed -i -e "s/^Example/#Example/" /etc/freshclam.conf
elif [[ $detect == *"ubuntu"* ]]; then
	sudo apt-get update
	sudo apt-get install clamav
	sudo sed -i -e "s/^Example/#Example/" /etc/freshclam.conf
elif [[ $detect == *"centos"* ]]; then
    sudo yum install -y epel-release 
    sudo yum install -y clamav 
    sudo sed -i -e "s/^Example/#Example/" /etc/freshclam.conf
elif [[ $detect == *"alpine"* ]]; then
	sudo apk add clamav
	sudo sed -i -e "s/^Example/#Example/" /etc/clamav/freshclam.conf
fi

