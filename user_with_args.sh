#!/bin/bash
#args ./user-with-args

sudo useradd -m $1

echo -e "$2\n$2" | sudo passwd $1

echo "Total aruments add: $#"

echo "========== Creation of User Completed============"

