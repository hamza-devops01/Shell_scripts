#!/bin/bash

function create-user {
read -p "Enter username:" username

sudo useradd $username

echo "user created successfuly"

}
#create-user
#create-user

for (( i=1; i<=5; i++))
do
	create-user
done

