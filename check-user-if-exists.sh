#!/bin/bash

<<info
This shell script check if user exists
info

read -p "Enter user name you want to check:" username

count=$(cat /etc/passwd | grep $username | wc | awk '{print $1}')

if [ $count == 0 ];
then
	echo "User Does Not Exixt"
else
	echo "User Exixt"
fi


