#!/bin/bash

cat /etc/*-release | grep 'ID=' &> /dev/null
if [ $? == *"debian"* ]; then
   echo "debian"
elif [ $? == *"centos"* ]; then
   	echo "centos"
elif [ $? == *"alpine"* ]; then
   	echo "alpine"
else
	echo $?
	echo $
fi
