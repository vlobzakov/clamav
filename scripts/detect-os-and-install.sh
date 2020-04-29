#!/bin/bash

detect=$(cat /etc/*-release | grep 'ID=')
<<<<<<< HEAD
if [ $detect == *"debian"* ]; then
	sudo apt-get update
	sudo apt-get install clamav
elif [[ $detect == *"ubuntu"* ]]; then
	sudo apt-get update
	sudo apt-get install clamav
=======
if [[ $detect == *"debian"* ]]; then
echo "debian"
>>>>>>> a69a90ea799525526c209ee4aa0b13413300715f
elif [[ $detect == *"centos"* ]]; then
    sudo yum install -y epel-release 
    sudo yum install -y clamav 
elif [[ $detect == *"alpine"* ]]; then
<<<<<<< HEAD
	sudo apk add clamav
fi

sudo sed -i -e "s/^Example/#Example/" /etc/freshclam.conf
=======
echo "alpine"
fi
>>>>>>> a69a90ea799525526c209ee4aa0b13413300715f
