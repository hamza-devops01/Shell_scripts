#!/bin/bash

# user defined vaibales
Hero="rancho"
villain="virus"

echo "3 idotios ka Hero ha $Hero"

echo "3 idotios ka villain ha $villain"

# shell / environment variable(Pre-Defined variable)

echo "current logged in user $USER"

# user input
read -p "Rancho ka pora name kaya tha?" fullname

echo "Rancho ka pora name $fullname tha"

# aruments

# ./3-idiots.sh raju farhan rancho

echo "movie ka name: $0"

echo "first idiot: $1"

echo "second idiot: $2"

echo "third idiot: $3"

echo "Total Number of idiots: $#"

echo "Hence the 3 idiot are $@"


