#!/bin/bash

detect=$(cat /etc/*-release | grep 'ID=')
if [[ $detect == *"debian"* ]]; then
	sudo apt-get remove clamav
elif [[ $detect == *"ubuntu"* ]]; then
	sudo apt-get remove clamav
elif [[ $detect == *"centos"* ]]; then
    sudo yum remove -y epel-release 
    sudo yum remove -y clamav 
elif [[ $detect == *"alpine"* ]]; then
	sudo apk del clamav
fi
