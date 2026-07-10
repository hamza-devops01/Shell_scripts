#!/bin/bash

echo "========== Welcome to Delete User ============"

read -p "Enter username:" username

sudo userdel $username

cat -e "/etc/passwd" | grep -i "$username" | wc

echo "========== User  Deleted Successfuly ============"

