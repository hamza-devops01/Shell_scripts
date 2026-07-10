#A
#!/bin/bash

<<info
B
User Account Management Script
 This script allows you to:
 1. Create a user account
 2. Delete a user account
 3. Reset a user's password
 4. List all user accounts
 5. Display help information
info

#Fuction to display the information
function showhelp {
	echo "=============================================="
    echo " User Account Management Script"
    	echo "=============================================="
	echo "Usage: $0 [Option]"
	echo "Options:"
	echo " -c, --create     Create a new user account"
	echo " -d, --delete     Delete an existing user account"
        echo " -r, --reset      Reset password of a user account"
        echo " -l, --list       List all user accounts"
        echo " -h, --help       Display this help message"
	
}

#Function to create a user
create_user() {
	echo "Create User"
  read -p "Enter a Username:" username

  ## Check if user already exists
  if id "$username" &>/dev/null; then
	 echo"Error: User "$username" Already exists"
	 exit 1
  fi

    read -s -p "Enter password:" password

    #user creation
    sudo useradd  "$username"

    if [[ $? -ne 0 ]]; then
	    echo "Failed to create user"
	    exit 1
	 fi
    #Adding password
    echo "$username:$password" | sudo chpasswd
    echo "User "$username" created successfully"
  }

#Function to delete a user

del_user() {
	echo "Delete User"
       read -p "Enter username to delete: " username

    if ! id "$username" &>/dev/null; then
        echo "Error: User "$username" does not exist."
        exit 1
    fi

    sudo userdel -r "$username" 2>/dev/null

    if [ $? -eq 0 ]; then
        echo "User "$username" deleted successfully."
    else
        echo "Failed to delete user."
    fi
	
}

#Function to reset passwd
reset_passwd() {
	echo "Reset password"
    read -p "Enter Username:" username
    if ! id "$username" &>/dev/null;then
            echo "Error: User "$username" dose not exist"
            exit 1
        fi


     read -s -p "Enter password:" password
     echo "$username:$password" | sudo chpasswd

     if [[ $? -eq 0 ]];then
	echo "password reset successfully for "$username" "
else
	echo "password reset failed"
     fi

}


list_users() {
    echo "----------------------------------------"
    printf "%-20s %-10s\n" "USERNAME" "UID"
    echo "----------------------------------------"

    awk -F: '{printf "%-20s %-10s\n",$1,$3}' /etc/passwd

    echo "----------------------------------------"
}

case  "$1" in 
	-c|--create)
		create_user;;
	-d|--delete)
		del_user;;
	-r|--reset)
		reset_passwd;;
	-l|--list)
		list_users;;
	-h|--help)
		showhelp;;
	*)
		echo "Invalid option"
		showhelp
		exit 1
esac


#create_user
#del_user
#reset_passwd
#list_users
