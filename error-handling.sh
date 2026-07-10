#!/bin/bash

create_directory(){

	mkdir demo
}

 if ! create_directory; then
	 echo "The code is begin exited because the directory already exits"
	 exit 1
fi

echo "This should not work because the code is interrupted"

