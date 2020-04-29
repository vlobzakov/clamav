#!/bin/bash

detect=$(cat /etc/*-release | grep 'ID=')
if [ $detect == *"debian"* ]; then
echo "debian"
elif [[ $detect == *"centos"* ]]; then
echo "centos"
elif [[ $detect == *"alpine"* ]]; then
echo "alpine"

fi