#A
#!/bin/bash

# This is a shell script to create user
<<disclaimer
 This is a shell Script 
 to create a user
disclaimer

#create user

function create-user {
echo "========== Creation of User Started ============"

read -p "enter the username:" username

read -p "enter the password:" password

sudo useradd -m "$username"

echo -e "$password\n$password" | sudo passwd "$username"

echo "========== Creation of User Completed============"
}

#user delete

function delete-user {
echo "========== Welcome to Delete User ============"

read -p "enter the username:" username

sudo userdel $username

echo "========== User  Deleted Successfuly ============"

}

#user check

function check-user {

if [ $(cat "/etc/passwd" | grep -i "$username" | wc | awk '{print $1}') == 0 ];
then
     echo "as wc is 0 the user is deleted"
else
	echo "user was not deleted"
fi


}

delete-user
check-user
